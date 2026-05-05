import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));

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
        // Handle notification tap if needed
      },
    );

    _initialized = true;
  }

  Future<bool> requestPermissions() async {
    if (!_initialized) await init();

    try {
      // 1. Request Notification Permission (Android 13+)
      final status = await Permission.notification.status;
      if (!status.isGranted) {
        await Permission.notification.request();
      }

      // 2. Exact Alarms (Android 12+)
      // Since we use USE_EXACT_ALARM in manifest, it's granted at install time on Android 13+.
      // But we can still check it. For Android 14+, calling requestExactAlarmsPermission
      // can trigger a system settings redirect, so we skip it if already granted
      // or if using USE_EXACT_ALARM.
      
      final androidImplementation = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      if (androidImplementation != null) {
        // Just checking if we can schedule exact alarms
        // On Android 13+ with USE_EXACT_ALARM, this is typically true.
        bool? canSchedule = await androidImplementation.canScheduleExactNotifications();
        if (canSchedule == false) {
          // If for some reason it's not granted, we might want to request it,
          // but we do it carefully to avoid hanging.
          await androidImplementation.requestExactAlarmsPermission();
        }
      }

      final iosImplementation = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      if (iosImplementation != null) {
        await iosImplementation.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
      }
      return true;
    } catch (e) {
      print('Error requesting permissions: $e');
      return false;
    }
  }

  AndroidNotificationDetails _adhanAndroidDetails() {
    return const AndroidNotificationDetails(
      'adhan_channel_id_v4',
      'Waktu Adzan',
      channelDescription: 'Notifikasi waktu sholat dengan suara adzan',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('adhan'),
      audioAttributesUsage: AudioAttributesUsage.alarm,
      enableVibration: true,
      icon: '@drawable/ic_notification',
    );
  }

  AndroidNotificationDetails _adhanSubuhAndroidDetails() {
    return const AndroidNotificationDetails(
      'adhan_subuh_channel_id_v2',
      'Waktu Adzan Subuh',
      channelDescription: 'Notifikasi waktu sholat subuh',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('adhan_subuh'),
      audioAttributesUsage: AudioAttributesUsage.alarm,
      enableVibration: true,
      icon: '@drawable/ic_notification',
    );
  }

  AndroidNotificationDetails _adhanDefaultAndroidDetails() {
    return const AndroidNotificationDetails(
      'adhan_channel_default_v1',
      'Waktu Adzan (Biasa)',
      channelDescription: 'Notifikasi waktu sholat dengan suara standar',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
      icon: '@drawable/ic_notification',
    );
  }

  AndroidNotificationDetails _dzikirAndroidDetails() {
    return const AndroidNotificationDetails(
      'dzikir_channel_id_v4',
      'Pengingat Dzikir',
      channelDescription: 'Notifikasi pengingat dzikir pagi dan petang',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      icon: '@drawable/ic_notification',
    );
  }

  AndroidNotificationDetails _demoAndroidDetails() {
    return const AndroidNotificationDetails(
      'demo_channel_v1',
      'Demo',
      channelDescription: 'Channel Tes Demo',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
      icon: '@mipmap/ic_launcher',
    );
  }

  Future<void> showDemoNotification() async {
    try {
      if (!_initialized) await init();
      print('=== DEBUG DEMO NOTIFICATION: init done ===');
      
      await _notificationsPlugin.show(
        id: 99999,
        title: 'Demo Notifikasi',
        body: 'Ini adalah contoh tes tampilan notifikasi dari aplikasi Dzikir Pagi & Petang.',
        notificationDetails: NotificationDetails(
          android: _demoAndroidDetails(),
          iOS: const DarwinNotificationDetails(),
        ),
      );
      print('=== DEBUG DEMO NOTIFICATION: show done ===');
    } catch (e, stack) {
      print('=== DEBUG DEMO NOTIFICATION ERROR: \$e');
      print(stack);
    }
  }

  Future<void> schedulePeriodicDzikir(
    bool pagiDoneToday,
    bool petangDoneToday,
  ) async {
    if (!_initialized) await init();

    await cancelDzikirSchedules();
    final now = DateTime.now();

    for (int i = 0; i < 7; i++) {
      final date = now.add(Duration(days: i));

      // Pagi: 06:00, 06:30, 07:00, 07:30, 08:00
      if (!(i == 0 && pagiDoneToday)) {
        final pagiTimes = [
          DateTime(date.year, date.month, date.day, 6, 0),
          DateTime(date.year, date.month, date.day, 6, 30),
          DateTime(date.year, date.month, date.day, 7, 0),
          DateTime(date.year, date.month, date.day, 7, 30),
          DateTime(date.year, date.month, date.day, 8, 0),
        ];
        for (int p = 0; p < pagiTimes.length; p++) {
          if (pagiTimes[p].isAfter(now)) {
            final tzTime = tz.TZDateTime.from(pagiTimes[p], tz.local);
            await _notificationsPlugin.zonedSchedule(
              id: 20000 + (i * 10) + p,
              title: 'Waktunya Dzikir Pagi',
              body:
                  'Mari membaca Dzikir Pagi. (Waktu: ${DateFormat('HH:mm').format(pagiTimes[p])})',
              scheduledDate: tzTime,
              notificationDetails: NotificationDetails(
                android: _dzikirAndroidDetails(),
                iOS: const DarwinNotificationDetails(),
              ),
              androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            );
          }
        }
      }

      // Petang: 16:30, 17:00, 17:30
      if (!(i == 0 && petangDoneToday)) {
        final petangTimes = [
          DateTime(date.year, date.month, date.day, 16, 30),
          DateTime(date.year, date.month, date.day, 17, 0),
          DateTime(date.year, date.month, date.day, 17, 30),
        ];
        for (int p = 0; p < petangTimes.length; p++) {
          if (petangTimes[p].isAfter(now)) {
            final tzTime = tz.TZDateTime.from(petangTimes[p], tz.local);
            await _notificationsPlugin.zonedSchedule(
              id: 30000 + (i * 10) + p,
              title: 'Waktunya Dzikir Petang',
              body:
                  'Mari membaca Dzikir Petang. (Waktu: ${DateFormat('HH:mm').format(petangTimes[p])})',
              scheduledDate: tzTime,
              notificationDetails: NotificationDetails(
                android: _dzikirAndroidDetails(),
                iOS: const DarwinNotificationDetails(),
              ),
              androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            );
          }
        }
      }
    }
  }

  Future<void> scheduleAdhanTimes(Coordinates coordinates, bool useAdhanSound) async {
    if (!_initialized) await init();

    // Cancel existing adhan schedules first
    await cancelAdhanSchedules();

    final now = DateTime.now();
    final params = CalculationMethod.singapore.getParameters();
    params.madhab = Madhab.shafi;

    // Schedule for the next 7 days
    for (int i = 0; i < 7; i++) {
      final date = now.add(Duration(days: i));
      final dateComponents = DateComponents(date.year, date.month, date.day);
      final prayerTimes = PrayerTimes(coordinates, dateComponents, params);

      // We use base 10000 to differentiate from dzikir
      int dayOffset = i * 100;

      await _scheduleSinglePrayer(10001 + dayOffset, 'Subuh', prayerTimes.fajr, useAdhanSound);
      await _scheduleSinglePrayer(
        10002 + dayOffset,
        'Dzuhur',
        prayerTimes.dhuhr,
        useAdhanSound,
      );
      await _scheduleSinglePrayer(10003 + dayOffset, 'Ashar', prayerTimes.asr, useAdhanSound);
      await _scheduleSinglePrayer(
        10004 + dayOffset,
        'Maghrib',
        prayerTimes.maghrib,
        useAdhanSound,
      );
      await _scheduleSinglePrayer(10005 + dayOffset, 'Isya', prayerTimes.isha, useAdhanSound);
    }
  }

  Future<void> _scheduleSinglePrayer(
    int id,
    String prayerName,
    DateTime time,
    bool useAdhanSound,
  ) async {
    if (time.isBefore(DateTime.now())) return;

    final tzTime = tz.TZDateTime.from(time, tz.local);
    final timeStr = DateFormat('HH:mm').format(time);

    AndroidNotificationDetails details;
    String? soundName;
    if (useAdhanSound) {
      details = prayerName == 'Subuh'
          ? _adhanSubuhAndroidDetails()
          : _adhanAndroidDetails();
      soundName = prayerName == 'Subuh' ? 'adhan_subuh.aiff' : 'adhan.aiff';
    } else {
      details = _adhanDefaultAndroidDetails();
      soundName = null;
    }

    await _notificationsPlugin.zonedSchedule(
      id: id,
      title: 'Waktu Sholat $prayerName',
      body:
          'Telah masuk waktu sholat $prayerName ($timeStr) untuk wilayah Anda.',
      scheduledDate: tzTime,
      notificationDetails: NotificationDetails(
        android: details,
        iOS: DarwinNotificationDetails(sound: soundName),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> showTestNotification(bool useAdhanSound) async {
    if (!_initialized) await init();

    AndroidNotificationDetails details = useAdhanSound ? _adhanAndroidDetails() : _adhanDefaultAndroidDetails();
    String? soundName = useAdhanSound ? 'adhan.aiff' : null;

    await _notificationsPlugin.show(
      id: 99999,
      title: useAdhanSound ? 'Test Adzan 🕋' : 'Test Waktu Sholat 🕋',
      body: 'Ini adalah simulasi notifikasi waktu sholat.',
      notificationDetails: NotificationDetails(
        android: details,
        iOS: DarwinNotificationDetails(sound: soundName),
      ),
    );
  }

  Future<void> showTestDzikirNotification() async {
    if (!_initialized) await init();

    await _notificationsPlugin.show(
      id: 88888,
      title: 'Test Dzikir Pagi/Petang 📿',
      body: 'Waktunya Dzikir! (Simulasi)',
      notificationDetails: NotificationDetails(
        android: _dzikirAndroidDetails(),
        iOS: const DarwinNotificationDetails(),
      ),
    );
  }

  Future<void> cancelAdhanSchedules() async {
    if (!_initialized) await init();
    // Cancel IDs from 10000 to 11000 (covers 7 days)
    for (int i = 0; i < 700; i++) {
      await _notificationsPlugin.cancel(id: 10000 + i);
    }
  }

  Future<void> cancelDzikirSchedules() async {
    if (!_initialized) await init();
    await _notificationsPlugin.cancel(id: 6000);
    await _notificationsPlugin.cancel(id: 7000);

    for (int i = 0; i < 7; i++) {
      for (int p = 0; p < 5; p++) {
        await _notificationsPlugin.cancel(id: 20000 + (i * 10) + p);
      }
      for (int p = 0; p < 3; p++) {
        await _notificationsPlugin.cancel(id: 30000 + (i * 10) + p);
      }
    }
  }
}
