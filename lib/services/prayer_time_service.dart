import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class PrayerTimeService {
  static PrayerTimes? getPrayerTimes({
    required double lat,
    required double lon,
    int methodIndex = 20,
    DateTime? date,
  }) {
    try {
      final coordinates = Coordinates(lat, lon);
      final now = date ?? DateTime.now();
      final dateComponents = DateComponents(now.year, now.month, now.day);
      final params = _getParams(methodIndex);
      return PrayerTimes(coordinates, dateComponents, params);
    } catch (e) {
      return null;
    }
  }

  static CalculationParameters _getParams(int method) {
    // method 20 = Kemenag RI (Siap pakai untuk Indonesia)
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
        return CalculationMethod.singapore.getParameters();
      case 20:
      default:
        // Indonesia – Kemenag RI
        final params = CalculationMethod.singapore.getParameters();
        params.madhab = Madhab.shafi;
        params.fajrAngle = 20.0;
        params.ishaAngle = 18.0;
        return params;
    }
  }

  static String formatTime(DateTime? dt) {
    if (dt == null) return '--:--';
    return DateFormat('HH:mm').format(dt.toLocal());
  }

  static Prayer nextPrayer(PrayerTimes times) {
    return times.nextPrayer();
  }

  static DateTime? nextPrayerTime(PrayerTimes times) {
    return times.timeForPrayer(times.nextPrayer());
  }

  static String nextPrayerName(PrayerTimes times) {
    switch (times.nextPrayer()) {
      case Prayer.fajr:
        return 'Subuh';
      case Prayer.sunrise:
        return 'Terbit';
      case Prayer.dhuhr:
        return 'Dhuhur';
      case Prayer.asr:
        return 'Ashar';
      case Prayer.maghrib:
        return 'Maghrib';
      case Prayer.isha:
        return 'Isya';
      case Prayer.none:
        return 'Subuh';
    }
  }

  static Map<String, DateTime?> getAllTimes(PrayerTimes times) {
    return {
      'Subuh': times.fajr,
      'Syuruq': times.sunrise,
      'Dhuhur': times.dhuhr,
      'Ashar': times.asr,
      'Maghrib': times.maghrib,
      'Isya': times.isha,
    };
  }

  static Duration? countdown(DateTime? nextTime) {
    if (nextTime == null) return null;
    final now = DateTime.now();
    if (nextTime.isBefore(now)) return null;
    return nextTime.difference(now);
  }

  static String formatCountdown(Duration? dur) {
    if (dur == null) return '--';
    final h = dur.inHours;
    final m = dur.inMinutes % 60;
    final s = dur.inSeconds % 60;
    if (h > 0) return '${h}j ${m}m ${s}d';
    if (m > 0) return '${m}m ${s}d';
    return '${s}d lagi';
  }
}
