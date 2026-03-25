import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _pagiCountersKey = 'dzikir_pagi_counters';
  static const String _petangCountersKey = 'dzikir_petang_counters';
  static const String _pagiCompletedDateKey = 'dzikir_pagi_completed_date';
  static const String _petangCompletedDateKey = 'dzikir_petang_completed_date';
  static const String _cityKey = 'selected_city';
  static const String _latKey = 'saved_lat';
  static const String _lonKey = 'saved_lon';
  static const String _methodKey = 'calculation_method';
  static const String _notifAdzanKey = 'notif_adzan';
  static const String _useAdhanSoundKey = 'use_adhan_sound';
  static const String _notifDzikirKey = 'notif_dzikir';
  static const String _tasbihTotalKey = 'tasbih_total';
  static const String _fontSize = 'arabic_font_size';
  static const String _firstLaunchKey = 'first_launch_done';

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs {
    if (_prefs == null) throw Exception('StorageService not initialized');
    return _prefs!;
  }

  // ─── Dzikir Progress ─────────────────────────────────────────────────────

  List<int> getPagiCounters(int total) {
    final List<String>? raw = prefs.getStringList(_pagiCountersKey);
    if (raw == null || raw.length != total) return List.filled(total, 0);
    return raw.map((e) => int.tryParse(e) ?? 0).toList();
  }

  Future<void> savePagiCounter(int index, int count) async {
    // Get fresh list
    final List<String> raw = prefs.getStringList(_pagiCountersKey) ?? [];
    while (raw.length <= index) raw.add('0');
    raw[index] = count.toString();
    await prefs.setStringList(_pagiCountersKey, raw);
  }

  List<int> getPetangCounters(int total) {
    final List<String>? raw = prefs.getStringList(_petangCountersKey);
    if (raw == null || raw.length != total) return List.filled(total, 0);
    return raw.map((e) => int.tryParse(e) ?? 0).toList();
  }

  Future<void> savePetangCounter(int index, int count) async {
    final List<String> raw = prefs.getStringList(_petangCountersKey) ?? [];
    while (raw.length <= index) raw.add('0');
    raw[index] = count.toString();
    await prefs.setStringList(_petangCountersKey, raw);
  }

  Future<void> resetPagiProgress() async {
    await prefs.remove(_pagiCountersKey);
    await prefs.remove(_pagiCompletedDateKey);
  }

  Future<void> resetPetangProgress() async {
    await prefs.remove(_petangCountersKey);
    await prefs.remove(_petangCompletedDateKey);
  }

  // ─── Daily Reset Logic ────────────────────────────────────────────────────

  static const String _lastResetDateKey = 'last_reset_date';

  bool shouldResetDaily() {
    final String? lastDate = prefs.getString(_lastResetDateKey);
    final String today = _todayString();
    return lastDate != today;
  }

  Future<void> performDailyReset() async {
    await resetPagiProgress();
    await resetPetangProgress();
    await prefs.setString(_lastResetDateKey, _todayString());
  }

  Future<void> markPagiCompleted() async {
    await prefs.setString(_pagiCompletedDateKey, _todayString());
  }

  Future<void> markPetangCompleted() async {
    await prefs.setString(_petangCompletedDateKey, _todayString());
  }

  bool hasCompletedPagiToday() {
    return prefs.getString(_pagiCompletedDateKey) == _todayString();
  }

  bool hasCompletedPetangToday() {
    return prefs.getString(_petangCompletedDateKey) == _todayString();
  }

  String _todayString() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }

  // ─── Location Settings ────────────────────────────────────────────────────

  String getCity() => prefs.getString(_cityKey) ?? 'Lokasi Saya';

  Future<void> saveCity(String city) async =>
      prefs.setString(_cityKey, city);

  double? getSavedLat() {
    final val = prefs.getDouble(_latKey);
    return val;
  }

  double? getSavedLon() => prefs.getDouble(_lonKey);

  Future<void> saveLocation(double lat, double lon) async {
    await prefs.setDouble(_latKey, lat);
    await prefs.setDouble(_lonKey, lon);
  }

  int getCalculationMethod() => prefs.getInt(_methodKey) ?? 20; // Kemenag RI

  Future<void> saveCalculationMethod(int method) async =>
      prefs.setInt(_methodKey, method);

  // ─── Notifications ────────────────────────────────────────────────────────

  bool getNotifAdzan() => prefs.getBool(_notifAdzanKey) ?? true;

  Future<void> saveNotifAdzan(bool val) async =>
      prefs.setBool(_notifAdzanKey, val);

  bool getUseAdhanSound() => prefs.getBool(_useAdhanSoundKey) ?? true;

  Future<void> saveUseAdhanSound(bool val) async =>
      prefs.setBool(_useAdhanSoundKey, val);

  bool getNotifDzikir() => prefs.getBool(_notifDzikirKey) ?? true;

  Future<void> saveNotifDzikir(bool val) async =>
      prefs.setBool(_notifDzikirKey, val);

  // ─── Tasbih ───────────────────────────────────────────────────────────────

  int getTasbihTotal() => prefs.getInt(_tasbihTotalKey) ?? 0;

  Future<void> saveTasbihTotal(int total) async =>
      prefs.setInt(_tasbihTotalKey, total);

  // ─── Font Size ────────────────────────────────────────────────────────────

  double getArabicFontSize() => prefs.getDouble(_fontSize) ?? 28.0;

  Future<void> saveArabicFontSize(double size) async =>
      prefs.setDouble(_fontSize, size);

  // ─── First Launch ─────────────────────────────────────────────────────────

  bool isFirstLaunch() => !(prefs.getBool(_firstLaunchKey) ?? false);

  Future<void> markLaunched() async =>
      prefs.setBool(_firstLaunchKey, true);
}
