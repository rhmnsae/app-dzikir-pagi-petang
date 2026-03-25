import 'dart:math' as math;

class QiblaService {
  // Koordinat Ka'bah, Makkah
  static const double _kaabaLat = 21.4225;
  static const double _kaabaLon = 39.8262;
  // Radius bumi (km)
  static const double _earthRadiusKm = 6371.0;

  /// Menghitung sudut arah kiblat (bearing) dari koordinat user ke Ka'bah.
  /// Hasil dalam derajat (0–360), dihitung dari Utara searah jarum jam.
  static double getQiblaAngle(double userLat, double userLon) {
    final lat1 = _toRad(userLat);
    final lat2 = _toRad(_kaabaLat);
    final dLon = _toRad(_kaabaLon - userLon);

    final y = math.sin(dLon) * math.cos(lat2);
    final x = math.cos(lat1) * math.sin(lat2) -
        math.sin(lat1) * math.cos(lat2) * math.cos(dLon);

    final bearing = math.atan2(y, x);
    return (_toDeg(bearing) + 360) % 360;
  }

  /// Menghitung jarak (km) antara user dan Ka'bah menggunakan Haversine formula.
  static double getDistanceToMakkah(double userLat, double userLon) {
    final lat1 = _toRad(userLat);
    final lat2 = _toRad(_kaabaLat);
    final dLat = _toRad(_kaabaLat - userLat);
    final dLon = _toRad(_kaabaLon - userLon);

    final a = math.pow(math.sin(dLat / 2), 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.pow(math.sin(dLon / 2), 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return _earthRadiusKm * c;
  }

  /// Format jarak ke string yang mudah dibaca
  static String formatDistance(double km) {
    if (km < 1) return '${(km * 1000).round()} m';
    if (km < 10) return '${km.toStringAsFixed(1)} km';
    return '${km.round()} km';
  }

  static double _toRad(double deg) => deg * math.pi / 180;
  static double _toDeg(double rad) => rad * 180 / math.pi;
}
