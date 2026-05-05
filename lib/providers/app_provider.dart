import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:adhan/adhan.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../services/storage_service.dart';
import '../services/prayer_time_service.dart';
import '../data/dzikir_pagi_data.dart';
import '../data/dzikir_petang_data.dart';
import '../main.dart'; // Import to use navigatorKey
import '../core/theme/app_colors.dart'; // Import for UI colors
import '../widgets/grid_background.dart'; // Import for grid background
import '../services/notification_service.dart';
import 'package:audioplayers/audioplayers.dart';

class AppProvider extends ChangeNotifier {
  final StorageService _storage;

  AppProvider(this._storage);

  PrayerTimes? _prayerTimes;
  double _lat = -6.2088; // Jakarta default
  double _lon = 106.8456;
  String _cityName = 'Jakarta';
  bool _locationLoading = false;
  String? _locationError;
  DateTime _now = DateTime.now();
  StreamSubscription<ServiceStatus>? _serviceStatusStreamSubscription;

  bool _adhanEnabled = false;
  bool _useAdhanSound = true;
  bool _dzikirEnabled = false;
  
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlayingAdzan = false;
  bool _isPlayingSubuh = false;
  bool _isPlayingBiasa = false;

  // ─── Dzikir counters ────────────────────────────────
  late List<int> _pagiCounters;
  late List<int> _petangCounters;

  // ─── Getters ─────────────────────────────────────────
  PrayerTimes? get prayerTimes => _prayerTimes;
  double get lat => _lat;
  double get lon => _lon;
  String get cityName => _cityName;
  bool get locationLoading => _locationLoading;
  String? get locationError => _locationError;
  DateTime get now => _now;
  List<int> get pagiCounters => _pagiCounters;
  List<int> get petangCounters => _petangCounters;

  bool get adhanEnabled => _adhanEnabled;
  bool get useAdhanSound => _useAdhanSound;
  bool get dzikirEnabled => _dzikirEnabled;
  bool get isPlayingAdzan => _isPlayingAdzan;
  bool get isPlayingSubuh => _isPlayingSubuh;
  bool get isPlayingBiasa => _isPlayingBiasa;
  StorageService get storage => _storage;

  int get pagiCompleted =>
      _pagiCounters.where((c) => c >= dzikirPagiList[_pagiCounters.indexOf(c)].repeatCount).length;

  int get petangCompleted =>
      _petangCounters.where((c) => c >= dzikirPetangList[_petangCounters.indexOf(c)].repeatCount).length;

  String get hijriDate {
    final h = HijriCalendar.now();
    final monthNames = [
      '', 'Muharram', 'Shafar', 'Rabi\'ul Awwal', 'Rabi\'ul Akhir',
      'Jumadil Awwal', 'Jumadil Akhir', 'Rajab', 'Sya\'ban',
      'Ramadhan', 'Syawal', 'Dzulqa\'dah', 'Dzulhijjah'
    ];
    return '${h.hDay} ${monthNames[h.hMonth]} ${h.hYear} H';
  }

  String get masehibDate => DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(_now);

  // ─── Init ────────────────────────────────────────────
  Future<void> init() async {
    // Load saved location
    final savedLat = _storage.getSavedLat();
    final savedLon = _storage.getSavedLon();
    if (savedLat != null && savedLon != null) {
      _lat = savedLat;
      _lon = savedLon;
      _cityName = _storage.getCity();
    }

    // Load counters with daily reset
    if (_storage.shouldResetDaily()) {
      await _storage.performDailyReset();
    }
    _pagiCounters = _storage.getPagiCounters(dzikirPagiList.length);
    _petangCounters = _storage.getPetangCounters(dzikirPetangList.length);

    // Load notification settings
    _adhanEnabled = _storage.getNotifAdzan();
    _useAdhanSound = _storage.getUseAdhanSound();
    _dzikirEnabled = _storage.getNotifDzikir();
    
    if (_adhanEnabled || _dzikirEnabled) {
      NotificationService().init();
      _refreshSchedules();
    }

    _calculatePrayerTimes();
    notifyListeners();

    // Try to get fresh location in background
    _refreshLocation();

    // Listen to GPS status
    _listenToGpsStatus();

    // Tick timer every second
    _startTimer();

    _audioPlayer.onPlayerComplete.listen((_) {
      _isPlayingAdzan = false;
      _isPlayingSubuh = false;
      _isPlayingBiasa = false;
      notifyListeners();
    });
  }

  void _startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      _now = DateTime.now();
      notifyListeners();
      return true;
    });
  }

  void _listenToGpsStatus() {
    _serviceStatusStreamSubscription =
        Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status == ServiceStatus.enabled) {
        // If the dialog is open, we can let user dismiss it, 
        // or attempt to pop if we know it's our dialog. Simplest is to just refresh.
        _refreshLocation();
      } else if (status == ServiceStatus.disabled) {
        _locationError = 'Layanan lokasi tidak aktif';
        notifyListeners();
      }
    });
  }

  void _showGpsPrompt() {
    final context = navigatorKey.currentContext;
    if (context == null) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          elevation: 0,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: AppColors.black, width: 2),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: GridPainter(
                      spacing: 28.0,
                      color: AppColors.black.withOpacity(0.06),
                      strokeWidth: 1.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'GPS NONAKTIF',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Layanan lokasi GPS di perangkat Anda telah dimatikan. Aplikasi membutuhkan GPS untuk mendeteksi arah kiblat dan jadwal sholat dengan akurat.\n\nMohon sentuh tombol di bawah untuk mengaktifkannya kembali.',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.black,
                          foregroundColor: AppColors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: const Text(
                          'AKTIFKAN GPS',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          await Geolocator.openLocationSettings();
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _serviceStatusStreamSubscription?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _calculatePrayerTimes() {
    _prayerTimes = PrayerTimeService.getPrayerTimes(
      lat: _lat,
      lon: _lon,
      methodIndex: _storage.getCalculationMethod(),
    );
  }

  Future<void> _refreshLocation({bool showPrompt = false}) async {
    _locationLoading = true;
    _locationError = null;
    notifyListeners();

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _locationError = 'Layanan lokasi tidak aktif';
        _locationLoading = false;
        notifyListeners();
        if (showPrompt) _showGpsPrompt();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _locationError = 'Izin lokasi ditolak';
          _locationLoading = false;
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _locationError = 'Izin lokasi ditolak permanen. Buka Pengaturan.';
        _locationLoading = false;
        notifyListeners();
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _lat = pos.latitude;
      _lon = pos.longitude;

      // Reverse geocoding — get real city name
      try {
        final placemarks = await placemarkFromCoordinates(_lat, _lon);
        if (placemarks.isNotEmpty) {
          final p = placemarks.first;
          final sub = p.subLocality ?? '';
          final city = p.locality ?? p.administrativeArea ?? 'Tidak Diketahui';
          _cityName = sub.isNotEmpty ? '$sub, $city' : city;
        }
      } catch (_) {
        // Keep existing city name if geocoding fails
      }

      await _storage.saveLocation(_lat, _lon);
      await _storage.saveCity(_cityName);
      _calculatePrayerTimes();
    } catch (e) {
      _locationError = 'Gagal mendapatkan lokasi: $e';
    }

    _locationLoading = false;
    notifyListeners();
  }

  Future<void> refreshLocation() => _refreshLocation(showPrompt: true);

  // ─── Dzikir Actions ──────────────────────────────────

  Future<void> incrementPagiCounter(int index) async {
    if (_pagiCounters[index] < dzikirPagiList[index].repeatCount) {
      _pagiCounters[index]++;
      await _storage.savePagiCounter(index, _pagiCounters[index]);
      
      if (pagiCompleted >= dzikirPagiList.length && !_storage.hasCompletedPagiToday()) {
        await _storage.markPagiCompleted();
        await _refreshSchedules();
      }
      
      notifyListeners();
    }
  }

  Future<void> resetPagiCounter(int index) async {
    _pagiCounters[index] = 0;
    await _storage.savePagiCounter(index, 0);
    notifyListeners();
  }

  Future<void> incrementPetangCounter(int index) async {
    if (_petangCounters[index] < dzikirPetangList[index].repeatCount) {
      _petangCounters[index]++;
      await _storage.savePetangCounter(index, _petangCounters[index]);
      
      if (petangCompleted >= dzikirPetangList.length && !_storage.hasCompletedPetangToday()) {
        await _storage.markPetangCompleted();
        await _refreshSchedules();
      }
      
      notifyListeners();
    }
  }

  Future<void> resetPetangCounter(int index) async {
    _petangCounters[index] = 0;
    await _storage.savePetangCounter(index, 0);
    notifyListeners();
  }

  Future<void> resetAllPagi() async {
    await _storage.resetPagiProgress();
    _pagiCounters = List.filled(dzikirPagiList.length, 0);
    notifyListeners();
  }

  Future<void> resetAllPetang() async {
    await _storage.resetPetangProgress();
    _petangCounters = List.filled(dzikirPetangList.length, 0);
    notifyListeners();
  }

  // ─── Settings ────────────────────────────────────────

  Future<void> setCalculationMethod(int method) async {
    await _storage.saveCalculationMethod(method);
    _calculatePrayerTimes();
    notifyListeners();
  }

  Future<void> _refreshSchedules() async {
    final ns = NotificationService();
    await ns.init();

    if (_dzikirEnabled) {
      bool pagiDone = _storage.hasCompletedPagiToday();
      bool petangDone = _storage.hasCompletedPetangToday();
      await ns.schedulePeriodicDzikir(pagiDone, petangDone);
    } else {
      await ns.cancelDzikirSchedules();
    }

    if (_adhanEnabled && _prayerTimes != null) {
      final coordinates = _prayerTimes!.coordinates;
      await ns.scheduleAdhanTimes(coordinates, _useAdhanSound);
    } else {
      await ns.cancelAdhanSchedules();
    }
  }

  Future<void> toggleAdhan(bool val) async {
    _adhanEnabled = val;
    notifyListeners();
    await _storage.saveNotifAdzan(val);
    
    if (val) {
      await NotificationService().requestPermissions();
    }
    
    await _refreshSchedules();
    notifyListeners(); // Final refresh after schedules are updated
  }

  Future<void> toggleDzikir(bool val) async {
    _dzikirEnabled = val;
    notifyListeners();
    await _storage.saveNotifDzikir(val);
    
    if (val) {
      await NotificationService().requestPermissions();
    }
    
    await _refreshSchedules();
    notifyListeners(); // Final refresh after schedules are updated
  }

  Future<void> setUseAdhanSound(bool val) async {
    _useAdhanSound = val;
    await _storage.saveUseAdhanSound(val);
    if (_adhanEnabled) {
      _refreshSchedules();
    }
    notifyListeners();
  }

  Future<void> testBiasa() async {
    if (_isPlayingBiasa || _isPlayingAdzan || _isPlayingSubuh) {
      bool wasPlayingThis = _isPlayingBiasa;
      await _audioPlayer.stop();
      _isPlayingBiasa = false;
      _isPlayingAdzan = false;
      _isPlayingSubuh = false;
      notifyListeners();
      if (wasPlayingThis) return;
    }
    
    _isPlayingBiasa = true;
    notifyListeners();
    
    final source = AssetSource('audio/biasa.wav');
    await _audioPlayer.play(source);
  }

  Future<void> testAudio({required bool isSubuh}) async {
    if (_isPlayingAdzan || _isPlayingSubuh || _isPlayingBiasa) {
      bool wasPlayingThis = isSubuh ? _isPlayingSubuh : _isPlayingAdzan;
      await _audioPlayer.stop();
      _isPlayingAdzan = false;
      _isPlayingSubuh = false;
      _isPlayingBiasa = false;
      notifyListeners();
      if (wasPlayingThis) return;
    }

    if (isSubuh) {
      _isPlayingSubuh = true;
    } else {
      _isPlayingAdzan = true;
    }
    notifyListeners();

    final source = isSubuh 
        ? AssetSource('audio/adhan_subuh.mp3') 
        : AssetSource('audio/adhan.mp3');

    await _audioPlayer.play(source);
  }

  Future<void> testDzikirNotification() async {
    final ns = NotificationService();
    await ns.init();
    await ns.showTestDzikirNotification();
  }

  Future<void> testDemoNotification() async {
    print('=== DEBUG DEMO NOTIFICATION: AppProvider called ===');
    try {
      await NotificationService().requestPermissions();
      print('=== DEBUG DEMO NOTIFICATION: Permissions requested ===');
      await NotificationService().showDemoNotification();
    } catch (e, stack) {
      print('=== DEBUG DEMO NOTIFICATION ERROR IN PROVIDER: \$e');
      print(stack);
    }
  }
}
