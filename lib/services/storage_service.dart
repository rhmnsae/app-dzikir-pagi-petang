import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class StorageService {
  static const String _databaseName = 'dzikir_pagi_petang_local.db';
  static const int _databaseVersion = 1;

  static const String _pagiCountersKey = 'dzikir_pagi_counters';
  static const String _petangCountersKey = 'dzikir_petang_counters';
  static const String _pagiCompletedDateKey = 'dzikir_pagi_completed_date';
  static const String _petangCompletedDateKey = 'dzikir_petang_completed_date';
  static const String _lastResetDateKey = 'last_reset_date';
  static const String _cityKey = 'selected_city';
  static const String _latKey = 'saved_lat';
  static const String _lonKey = 'saved_lon';
  static const String _methodKey = 'calculation_method';
  static const String _notifAdzanKey = 'notif_adzan';
  static const String _useAdhanSoundKey = 'use_adhan_sound';
  static const String _notifDzikirKey = 'notif_dzikir';
  static const String _tasbihTotalKey = 'tasbih_total';
  static const String _fontSizeKey = 'arabic_font_size';
  static const String _firstLaunchKey = 'first_launch_done';
  static const String _migrationKey = 'sqlite_migration_v1_done';

  static const String _counterTypePagi = 'pagi';
  static const String _counterTypePetang = 'petang';

  Database? _db;
  final Map<String, String> _settings = {};
  final Map<String, List<int>> _counterCache = {
    _counterTypePagi: <int>[],
    _counterTypePetang: <int>[],
  };

  Future<void> init() async {
    final databasePath = await getDatabasesPath();
    _db = await openDatabase(
      p.join(databasePath, _databaseName),
      version: _databaseVersion,
      onCreate: _createDatabase,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );

    await _migrateFromSharedPreferences();
    await _loadSettingsCache();
    await _loadCounterCache(_counterTypePagi);
    await _loadCounterCache(_counterTypePetang);
  }

  Database get db {
    final database = _db;
    if (database == null) {
      throw StateError('StorageService belum diinisialisasi');
    }
    return database;
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE settings (
        key TEXT PRIMARY KEY,
        value TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE dzikir_progress (
        type TEXT NOT NULL,
        item_index INTEGER NOT NULL,
        count INTEGER NOT NULL DEFAULT 0,
        updated_at TEXT NOT NULL,
        PRIMARY KEY (type, item_index)
      )
    ''');

    await db.execute('''
      CREATE TABLE daily_status (
        name TEXT PRIMARY KEY,
        date TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');
  }

  Future<void> _migrateFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (_boolFromString(await _getSetting(_migrationKey)) == true) return;

    final keysToMigrate = <String>[
      _pagiCompletedDateKey,
      _petangCompletedDateKey,
      _lastResetDateKey,
      _cityKey,
      _methodKey,
      _notifAdzanKey,
      _useAdhanSoundKey,
      _notifDzikirKey,
      _tasbihTotalKey,
      _fontSizeKey,
      _firstLaunchKey,
    ];

    for (final key in keysToMigrate) {
      final value = prefs.get(key);
      if (value != null) {
        await _setSetting(key, value.toString());
      }
    }

    final lat = prefs.getDouble(_latKey);
    final lon = prefs.getDouble(_lonKey);
    if (lat != null) await _setSetting(_latKey, lat.toString());
    if (lon != null) await _setSetting(_lonKey, lon.toString());

    await _migrateCounterList(
      type: _counterTypePagi,
      rawCounters: prefs.getStringList(_pagiCountersKey),
    );
    await _migrateCounterList(
      type: _counterTypePetang,
      rawCounters: prefs.getStringList(_petangCountersKey),
    );

    await _setSetting(_migrationKey, 'true');
  }

  Future<void> _migrateCounterList({
    required String type,
    required List<String>? rawCounters,
  }) async {
    if (rawCounters == null) return;

    for (int i = 0; i < rawCounters.length; i++) {
      final count = int.tryParse(rawCounters[i]) ?? 0;
      await _saveCounter(type, i, count);
    }
  }

  Future<void> _loadSettingsCache() async {
    final rows = await db.query('settings');
    _settings
      ..clear()
      ..addEntries(
        rows.map(
          (row) => MapEntry(row['key'] as String, row['value'] as String),
        ),
      );
  }

  Future<void> _loadCounterCache(String type) async {
    final rows = await db.query(
      'dzikir_progress',
      where: 'type = ?',
      whereArgs: [type],
      orderBy: 'item_index ASC',
    );

    final counters = <int>[];
    for (final row in rows) {
      final index = row['item_index'] as int;
      while (counters.length <= index) {
        counters.add(0);
      }
      counters[index] = row['count'] as int;
    }
    _counterCache[type] = counters;
  }

  List<int> getPagiCounters(int total) {
    return _getCounters(_counterTypePagi, total);
  }

  Future<void> savePagiCounter(int index, int count) async {
    await _saveCounter(_counterTypePagi, index, count);
  }

  List<int> getPetangCounters(int total) {
    return _getCounters(_counterTypePetang, total);
  }

  Future<void> savePetangCounter(int index, int count) async {
    await _saveCounter(_counterTypePetang, index, count);
  }

  List<int> _getCounters(String type, int total) {
    final cached = List<int>.from(_counterCache[type] ?? <int>[]);
    if (cached.length < total) {
      cached.addAll(List<int>.filled(total - cached.length, 0));
    }
    if (cached.length > total) {
      return cached.take(total).toList();
    }
    return cached;
  }

  Future<void> _saveCounter(String type, int index, int count) async {
    final counters = List<int>.from(_counterCache[type] ?? <int>[]);
    while (counters.length <= index) {
      counters.add(0);
    }
    counters[index] = count;
    _counterCache[type] = counters;

    await db.insert('dzikir_progress', {
      'type': type,
      'item_index': index,
      'count': count,
      'updated_at': DateTime.now().toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> resetPagiProgress() async {
    await _resetProgress(_counterTypePagi, _pagiCompletedDateKey);
  }

  Future<void> resetPetangProgress() async {
    await _resetProgress(_counterTypePetang, _petangCompletedDateKey);
  }

  Future<void> _resetProgress(String type, String completedKey) async {
    _counterCache[type] = <int>[];
    _settings.remove(completedKey);

    await db.transaction((txn) async {
      await txn.delete('dzikir_progress', where: 'type = ?', whereArgs: [type]);
      await txn.delete('settings', where: 'key = ?', whereArgs: [completedKey]);
      await txn.delete(
        'daily_status',
        where: 'name = ?',
        whereArgs: [completedKey],
      );
    });
  }

  bool shouldResetDaily() {
    final lastDate = _settings[_lastResetDateKey];
    return lastDate != _todayString();
  }

  Future<void> performDailyReset() async {
    await resetPagiProgress();
    await resetPetangProgress();
    await _setSetting(_lastResetDateKey, _todayString());
  }

  Future<void> markPagiCompleted() async {
    await _markDailyStatus(_pagiCompletedDateKey);
  }

  Future<void> markPetangCompleted() async {
    await _markDailyStatus(_petangCompletedDateKey);
  }

  bool hasCompletedPagiToday() {
    return _settings[_pagiCompletedDateKey] == _todayString();
  }

  bool hasCompletedPetangToday() {
    return _settings[_petangCompletedDateKey] == _todayString();
  }

  Future<void> _markDailyStatus(String name) async {
    final today = _todayString();
    await _setSetting(name, today);
    await db.insert('daily_status', {
      'name': name,
      'date': today,
      'updated_at': DateTime.now().toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  String getCity() => _settings[_cityKey] ?? 'Lokasi Saya';

  Future<void> saveCity(String city) async {
    await _setSetting(_cityKey, city);
  }

  double? getSavedLat() => double.tryParse(_settings[_latKey] ?? '');

  double? getSavedLon() => double.tryParse(_settings[_lonKey] ?? '');

  Future<void> saveLocation(double lat, double lon) async {
    await _setSetting(_latKey, lat.toString());
    await _setSetting(_lonKey, lon.toString());
  }

  int getCalculationMethod() {
    return int.tryParse(_settings[_methodKey] ?? '') ?? 20;
  }

  Future<void> saveCalculationMethod(int method) async {
    await _setSetting(_methodKey, method.toString());
  }

  bool getNotifAdzan() => _getBool(_notifAdzanKey, defaultValue: true);

  Future<void> saveNotifAdzan(bool val) async {
    await _setSetting(_notifAdzanKey, val.toString());
  }

  bool getUseAdhanSound() => _getBool(_useAdhanSoundKey, defaultValue: true);

  Future<void> saveUseAdhanSound(bool val) async {
    await _setSetting(_useAdhanSoundKey, val.toString());
  }

  bool getNotifDzikir() => _getBool(_notifDzikirKey, defaultValue: true);

  Future<void> saveNotifDzikir(bool val) async {
    await _setSetting(_notifDzikirKey, val.toString());
  }

  int getTasbihTotal() {
    return int.tryParse(_settings[_tasbihTotalKey] ?? '') ?? 0;
  }

  Future<void> saveTasbihTotal(int total) async {
    await _setSetting(_tasbihTotalKey, total.toString());
  }

  double getArabicFontSize() {
    return double.tryParse(_settings[_fontSizeKey] ?? '') ?? 28.0;
  }

  Future<void> saveArabicFontSize(double size) async {
    await _setSetting(_fontSizeKey, size.toString());
  }

  bool isFirstLaunch() {
    return !_getBool(_firstLaunchKey, defaultValue: false);
  }

  Future<void> markLaunched() async {
    await _setSetting(_firstLaunchKey, 'true');
  }

  bool _getBool(String key, {required bool defaultValue}) {
    return _boolFromString(_settings[key]) ?? defaultValue;
  }

  bool? _boolFromString(String? value) {
    if (value == null) return null;
    if (value == 'true' || value == '1') return true;
    if (value == 'false' || value == '0') return false;
    return null;
  }

  Future<String?> _getSetting(String key) async {
    final rows = await db.query(
      'settings',
      columns: ['value'],
      where: 'key = ?',
      whereArgs: [key],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return rows.first['value'] as String?;
  }

  Future<void> _setSetting(String key, String value) async {
    _settings[key] = value;
    await db.insert('settings', {
      'key': key,
      'value': value,
      'updated_at': DateTime.now().toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  String _todayString() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }
}
