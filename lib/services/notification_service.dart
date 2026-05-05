import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  static const int _scheduleDays = 7;
  static const int _adhanBaseId = 10000;
  static const int _adhanReminderOffset = 50;
  static const int _dzikirPagiBaseId = 20000;
  static const int _dzikirPetangBaseId = 30000;
  static const int _slotsPerDzikirDay = 10;

  static const List<String> _prayerNames = [
    'Subuh',
    'Dzuhur',
    'Ashar',
    'Maghrib',
    'Isya',
  ];

  Future<void> init() async {
    if (_initialized) return;

    tz.initializeTimeZones();
    await _configureLocalTimezone();

    const androidInitialize = AndroidInitializationSettings(
      '@drawable/ic_notification',
    );
    const darwinInitialize = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: darwinInitialize,
    );

    await _notificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Reserved for opening the right dzikir/prayer screen from a tap.
      },
    );

    _initialized = true;
  }

  Future<void> _configureLocalTimezone() async {
    try {
      final timezoneInfo = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timezoneInfo.identifier));
    } catch (e) {
      debugPrint('Gagal membaca timezone perangkat, memakai Asia/Jakarta: $e');
      tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));
    }
  }

  Future<bool> requestPermissions() async {
    if (!_initialized) await init();

    try {
      final status = await Permission.notification.status;
      if (!status.isGranted) {
        final requestedStatus = await Permission.notification.request();
        if (!requestedStatus.isGranted) return false;
      }

      final androidImplementation = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      if (androidImplementation != null) {
        await androidImplementation.requestNotificationsPermission();

        final canSchedule = await androidImplementation
            .canScheduleExactNotifications();
        if (canSchedule == false) {
          await androidImplementation.requestExactAlarmsPermission();
        }
      }

      final iosImplementation = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      if (iosImplementation != null) {
        final granted = await iosImplementation.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
        return granted ?? false;
      }

      return true;
    } catch (e) {
      debugPrint('Error requesting notification permissions: $e');
      return false;
    }
  }

  AndroidNotificationDetails _adhanAndroidDetails() {
    return const AndroidNotificationDetails(
      'adhan_channel_id_v5',
      'Waktu Adzan',
      channelDescription: 'Notifikasi waktu sholat dengan suara adzan',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('adhan'),
      audioAttributesUsage: AudioAttributesUsage.alarm,
      enableVibration: true,
      icon: '@drawable/ic_notification',
      largeIcon: DrawableResourceAndroidBitmap('logo_notification'),
    );
  }

  AndroidNotificationDetails _adhanSubuhAndroidDetails() {
    return const AndroidNotificationDetails(
      'adhan_subuh_channel_id_v3',
      'Waktu Adzan Subuh',
      channelDescription: 'Notifikasi waktu sholat subuh',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('adhan_subuh'),
      audioAttributesUsage: AudioAttributesUsage.alarm,
      enableVibration: true,
      icon: '@drawable/ic_notification',
      largeIcon: DrawableResourceAndroidBitmap('logo_notification'),
    );
  }

  AndroidNotificationDetails _adhanDefaultAndroidDetails() {
    return const AndroidNotificationDetails(
      'adhan_channel_default_v2',
      'Pengingat Waktu Sholat',
      channelDescription:
          'Notifikasi pengingat dan waktu sholat dengan suara standar',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
      icon: '@drawable/ic_notification',
      largeIcon: DrawableResourceAndroidBitmap('logo_notification'),
    );
  }

  AndroidNotificationDetails _dzikirAndroidDetails() {
    return const AndroidNotificationDetails(
      'dzikir_channel_id_v5',
      'Pengingat Dzikir',
      channelDescription: 'Notifikasi pengingat dzikir pagi dan petang',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      icon: '@drawable/ic_notification',
      largeIcon: DrawableResourceAndroidBitmap('logo_notification'),
    );
  }

  AndroidNotificationDetails _demoAndroidDetails() {
    return const AndroidNotificationDetails(
      'demo_channel_v2',
      'Demo',
      channelDescription: 'Channel tes demo',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
      icon: '@drawable/ic_notification',
      largeIcon: DrawableResourceAndroidBitmap('logo_notification'),
    );
  }

  Future<void> showDemoNotification() async {
    try {
      if (!_initialized) await init();

      await _notificationsPlugin.show(
        id: 99999,
        title: 'Demo Notifikasi',
        body:
            'Ini adalah contoh tes tampilan notifikasi dari aplikasi Dzikir Pagi & Petang.',
        notificationDetails: NotificationDetails(
          android: _demoAndroidDetails(),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    } catch (e, stack) {
      debugPrint('Demo notification error: $e');
      debugPrint('$stack');
    }
  }

  Future<void> schedulePeriodicDzikir(
    bool pagiDoneToday,
    bool petangDoneToday,
  ) async {
    if (!_initialized) await init();

    await cancelDzikirSchedules();
    final now = DateTime.now();

    for (int i = 0; i < _scheduleDays; i++) {
      final date = now.add(Duration(days: i));

      if (!(i == 0 && pagiDoneToday)) {
        final pagiTimes = _buildHalfHourlyTimes(date, 6, 0, 8, 0);
        for (int p = 0; p < pagiTimes.length; p++) {
          if (pagiTimes[p].isAfter(now)) {
            await _zonedScheduleSafely(
              id: _dzikirPagiBaseId + (i * _slotsPerDzikirDay) + p,
              title: 'Waktunya Dzikir Pagi',
              body:
                  'Mari membaca Dzikir Pagi. Pengingat pukul ${DateFormat('HH:mm').format(pagiTimes[p])}.',
              scheduledDate: pagiTimes[p],
              notificationDetails: NotificationDetails(
                android: _dzikirAndroidDetails(),
                iOS: const DarwinNotificationDetails(),
              ),
              payload: 'dzikir_pagi',
            );
          }
        }
      }

      if (!(i == 0 && petangDoneToday)) {
        final petangTimes = _buildHalfHourlyTimes(date, 16, 0, 17, 30);
        for (int p = 0; p < petangTimes.length; p++) {
          if (petangTimes[p].isAfter(now)) {
            await _zonedScheduleSafely(
              id: _dzikirPetangBaseId + (i * _slotsPerDzikirDay) + p,
              title: 'Waktunya Dzikir Petang',
              body:
                  'Mari membaca Dzikir Petang. Pengingat pukul ${DateFormat('HH:mm').format(petangTimes[p])}.',
              scheduledDate: petangTimes[p],
              notificationDetails: NotificationDetails(
                android: _dzikirAndroidDetails(),
                iOS: const DarwinNotificationDetails(),
              ),
              payload: 'dzikir_petang',
            );
          }
        }
      }
    }
  }

  Future<void> scheduleAdhanTimes(
    Coordinates coordinates,
    bool useAdhanSound, {
    int methodIndex = 20,
  }) async {
    if (!_initialized) await init();

    await cancelAdhanSchedules();

    final now = DateTime.now();
    final params = _getCalculationParams(methodIndex);

    for (int i = 0; i < _scheduleDays; i++) {
      final date = now.add(Duration(days: i));
      final dateComponents = DateComponents(date.year, date.month, date.day);
      final prayerTimes = PrayerTimes(coordinates, dateComponents, params);
      final times = [
        prayerTimes.fajr,
        prayerTimes.dhuhr,
        prayerTimes.asr,
        prayerTimes.maghrib,
        prayerTimes.isha,
      ];

      for (int p = 0; p < times.length; p++) {
        await _scheduleSinglePrayer(
          _adhanBaseId + (i * 100) + p + 1,
          _prayerNames[p],
          times[p],
          useAdhanSound,
        );
      }
    }
  }

  Future<void> _scheduleSinglePrayer(
    int id,
    String prayerName,
    DateTime time,
    bool useAdhanSound,
  ) async {
    final now = DateTime.now();
    final timeStr = DateFormat('HH:mm').format(time);
    final reminderTime = time.subtract(const Duration(minutes: 10));

    if (reminderTime.isAfter(now)) {
      await _zonedScheduleSafely(
        id: id + _adhanReminderOffset,
        title: '10 Menit Menuju Adzan $prayerName',
        body:
            'Adzan $prayerName akan masuk pukul $timeStr. Silakan bersiap untuk sholat.',
        scheduledDate: reminderTime,
        notificationDetails: NotificationDetails(
          android: _adhanDefaultAndroidDetails(),
          iOS: const DarwinNotificationDetails(),
        ),
        payload: 'adhan_reminder_$prayerName',
      );
    }

    if (!time.isAfter(now)) return;

    final androidDetails = useAdhanSound
        ? (prayerName == 'Subuh'
              ? _adhanSubuhAndroidDetails()
              : _adhanAndroidDetails())
        : _adhanDefaultAndroidDetails();
    final soundName = useAdhanSound
        ? (prayerName == 'Subuh' ? 'adhan_subuh.mp3' : 'adhan.mp3')
        : null;

    await _zonedScheduleSafely(
      id: id,
      title: 'Waktu Sholat $prayerName',
      body:
          'Telah masuk waktu sholat $prayerName ($timeStr) untuk wilayah Anda.',
      scheduledDate: time,
      notificationDetails: NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(sound: soundName),
      ),
      payload: 'adhan_$prayerName',
    );
  }

  Future<void> showTestNotification(bool useAdhanSound) async {
    if (!_initialized) await init();

    final androidDetails = useAdhanSound
        ? _adhanAndroidDetails()
        : _adhanDefaultAndroidDetails();
    final soundName = useAdhanSound ? 'adhan.mp3' : null;

    await _notificationsPlugin.show(
      id: 99998,
      title: useAdhanSound ? 'Test Adzan' : 'Test Waktu Sholat',
      body: 'Ini adalah simulasi notifikasi waktu sholat.',
      notificationDetails: NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(sound: soundName),
      ),
    );
  }

  Future<void> showTestDzikirNotification() async {
    if (!_initialized) await init();

    await _notificationsPlugin.show(
      id: 88888,
      title: 'Test Dzikir Pagi/Petang',
      body: 'Waktunya Dzikir! Ini adalah simulasi notifikasi dzikir.',
      notificationDetails: NotificationDetails(
        android: _dzikirAndroidDetails(),
        iOS: const DarwinNotificationDetails(),
      ),
    );
  }

  Future<void> cancelAdhanSchedules() async {
    if (!_initialized) await init();

    for (int i = 0; i < _scheduleDays; i++) {
      for (int p = 0; p < _prayerNames.length; p++) {
        final id = _adhanBaseId + (i * 100) + p + 1;
        await _notificationsPlugin.cancel(id: id);
        await _notificationsPlugin.cancel(id: id + _adhanReminderOffset);
      }
    }
  }

  Future<void> cancelDzikirSchedules() async {
    if (!_initialized) await init();

    await _notificationsPlugin.cancel(id: 6000);
    await _notificationsPlugin.cancel(id: 7000);

    for (int i = 0; i < _scheduleDays; i++) {
      for (int p = 0; p < _slotsPerDzikirDay; p++) {
        await _notificationsPlugin.cancel(
          id: _dzikirPagiBaseId + (i * _slotsPerDzikirDay) + p,
        );
        await _notificationsPlugin.cancel(
          id: _dzikirPetangBaseId + (i * _slotsPerDzikirDay) + p,
        );
      }
    }
  }

  Future<int> pendingNotificationCount() async {
    if (!_initialized) await init();
    final pending = await _notificationsPlugin.pendingNotificationRequests();
    return pending.length;
  }

  List<DateTime> _buildHalfHourlyTimes(
    DateTime date,
    int startHour,
    int startMinute,
    int endHour,
    int endMinute,
  ) {
    final times = <DateTime>[];
    var current = DateTime(
      date.year,
      date.month,
      date.day,
      startHour,
      startMinute,
    );
    final end = DateTime(date.year, date.month, date.day, endHour, endMinute);

    while (!current.isAfter(end)) {
      times.add(current);
      current = current.add(const Duration(minutes: 30));
    }

    return times;
  }

  CalculationParameters _getCalculationParams(int method) {
    switch (method) {
      case 1:
        return CalculationMethod.north_america.getParameters();
      case 2:
        return CalculationMethod.muslim_world_league.getParameters();
      case 3:
        return CalculationMethod.egyptian.getParameters();
      case 4:
        return CalculationMethod.karachi.getParameters();
      case 5:
        return CalculationMethod.dubai.getParameters();
      case 6:
        return CalculationMethod.kuwait.getParameters();
      case 7:
        return CalculationMethod.qatar.getParameters();
      case 8:
        return CalculationMethod.singapore.getParameters()
          ..madhab = Madhab.shafi;
      case 20:
      default:
        return CalculationMethod.singapore.getParameters()
          ..madhab = Madhab.shafi
          ..fajrAngle = 20.0
          ..ishaAngle = 18.0;
    }
  }

  Future<void> _zonedScheduleSafely({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required NotificationDetails notificationDetails,
    String? payload,
  }) async {
    final tzTime = tz.TZDateTime.from(scheduledDate, tz.local);
    if (!tzTime.isAfter(tz.TZDateTime.now(tz.local))) return;

    try {
      await _notificationsPlugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tzTime,
        notificationDetails: notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: payload,
      );
    } catch (e) {
      debugPrint(
        'Exact notification gagal, mencoba mode inexact untuk $id: $e',
      );
      await _notificationsPlugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: tzTime,
        notificationDetails: notificationDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: payload,
      );
    }
  }
}
