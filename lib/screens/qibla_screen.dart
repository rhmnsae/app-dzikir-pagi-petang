import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/app_provider.dart';
import '../services/qibla_service.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Colors: only #303841 (black) and #F5F5F5 (white)
// ─────────────────────────────────────────────────────────────────────────────

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? _heading;
  bool _compassAvailable = true;

  @override
  void initState() {
    super.initState();
    if (FlutterCompass.events == null) {
      _compassAvailable = false;
      return;
    }
    FlutterCompass.events!.listen(
      (event) {
        if (mounted) setState(() => _heading = event.heading);
      },
      onError: (_) {
        if (mounted) setState(() => _compassAvailable = false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<AppProvider>();
    final qibla = QiblaService.getQiblaAngle(prov.lat, prov.lon);
    final dist = QiblaService.getDistanceToMakkah(prov.lat, prov.lon);
    final heading = _heading ?? 0.0;
    final diff = ((qibla - heading) % 360 + 360) % 360;
    final isAligned = diff < 5 || diff > 355;
    final dialRad = -heading * math.pi / 180;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.black,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'ARAH KIBLAT',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            color: AppColors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(height: 2, color: AppColors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => prov.refreshLocation(),
            child: Text(
              prov.locationLoading ? 'MEMUAT...' : 'PERBARUI',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),

                // ── Location block ──────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOKASI',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          color: AppColors.grey600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        prov.cityName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: AppColors.black,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${prov.lat.toStringAsFixed(5)}°  ${prov.lon.toStringAsFixed(5)}°',
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.grey600,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // ── Compass ─────────────────────────────────────────
                Center(
                  child: _compassAvailable
                      ? _WireCompass(
                          dialRad: dialRad,
                          qiblaAngle: qibla,
                          isAligned: isAligned,
                        )
                      : _NoCompass(qiblaAngle: qibla),
                ),

                const SizedBox(height: 28),

                // ── Divider ─────────────────────────────────────────
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 2,
                  color: AppColors.black,
                ),
                const SizedBox(height: 16),

                // ── Stats row ───────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: _Stat(
                          label: 'ARAH KIBLAT',
                          value: '${qibla.toStringAsFixed(1)}°',
                          sub: 'dari Utara',
                        ),
                      ),
                      Container(width: 1, height: 56, color: AppColors.grey400),
                      Expanded(
                        child: _Stat(
                          label: 'KE MAKKAH',
                          value: QiblaService.formatDistance(dist),
                          sub: '${(dist / 1.852).round()} NM',
                          align: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 1,
                  color: AppColors.grey400,
                ),
                const SizedBox(height: 16),

                // ── Alignment status ────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        color: isAligned ? AppColors.black : AppColors.grey400,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        isAligned
                            ? 'Menghadap Kiblat'
                            : 'Putar ${diff.round()}° ke arah kiblat',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isAligned
                              ? FontWeight.w900
                              : FontWeight.w500,
                          color: isAligned
                              ? AppColors.black
                              : AppColors.grey600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // ── Sensor line ─────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    _compassAvailable && _heading != null
                        ? 'Sensor aktif  ·  ${heading.toStringAsFixed(0)}° heading'
                        : _compassAvailable
                        ? 'Menunggu sensor...'
                        : 'Sensor kompas tidak tersedia',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.grey600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 1,
                  color: AppColors.grey200,
                ),

                // ── Calibration tip ─────────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
                  child: Text(
                    'Kalibrasi: gerakkan perangkat membentuk angka 8. Jauhkan dari benda logam untuk hasil akurat.',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.grey400,
                      height: 1.6,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Compass widget
// ─────────────────────────────────────────────────────────────────────────────

class _WireCompass extends StatelessWidget {
  final double dialRad;
  final double qiblaAngle;
  final bool isAligned;

  const _WireCompass({
    required this.dialRad,
    required this.qiblaAngle,
    required this.isAligned,
  });

  @override
  Widget build(BuildContext context) {
    const size = 240.0;
    return SizedBox(
      width: size + 6,
      height: size + 6,
      child: Stack(
        children: [
          // Rotating dial
          Transform.rotate(
            angle: dialRad,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: AppColors.black, width: 2.5),
              ),
              child: ClipOval(
                child: CustomPaint(
                  painter: _DialPainter(qiblaAngle: qiblaAngle),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
          ),
          // Fixed center mark (does not rotate)
          Positioned(
            top: size / 2 - 8,
            left: size / 2 - 8,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: isAligned ? AppColors.black : Colors.transparent,
                border: Border.all(color: AppColors.black, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Dial Painter — pure B&W ──────────────────────────────────────────────

class _DialPainter extends CustomPainter {
  final double qiblaAngle;
  _DialPainter({required this.qiblaAngle});

  static const _black = AppColors.black;
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = cx;

    final thinLine = Paint()
      ..color = _black.withValues(alpha: 0.10)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // ── Inner reference circles ─────────────────────────────────────────
    canvas.drawCircle(Offset(cx, cy), r * 0.62, thinLine);
    canvas.drawCircle(Offset(cx, cy), r * 0.32, thinLine);

    // ── Axis lines ──────────────────────────────────────────────────────
    for (int i = 0; i < 4; i++) {
      final angle = i * math.pi / 2;
      canvas.drawLine(
        Offset(
          cx + r * 0.32 * math.cos(angle),
          cy + r * 0.32 * math.sin(angle),
        ),
        Offset(
          cx + r * 0.90 * math.cos(angle),
          cy + r * 0.90 * math.sin(angle),
        ),
        thinLine,
      );
    }

    // ── 16 tick marks ───────────────────────────────────────────────────
    final tickPaint = Paint()
      ..color = _black
      ..strokeCap = StrokeCap.square;
    for (int i = 0; i < 16; i++) {
      final angle = (i * 22.5 - 90) * math.pi / 180;
      final isMain = i % 4 == 0;
      final isHalf = i % 2 == 0;
      final len = isMain ? 14.0 : (isHalf ? 9.0 : 5.0);
      tickPaint.strokeWidth = isMain ? 2.0 : 1.0;
      canvas.drawLine(
        Offset(cx + (r - 4) * math.cos(angle), cy + (r - 4) * math.sin(angle)),
        Offset(
          cx + (r - 4 - len) * math.cos(angle),
          cy + (r - 4 - len) * math.sin(angle),
        ),
        tickPaint,
      );
    }

    // ── Cardinal labels (plain text, no boxes) ──────────────────────────
    final tp = TextPainter(textDirection: TextDirection.ltr);
    const cardinals = {'U': 0.0, 'T': 90.0, 'S': 180.0, 'B': 270.0};
    for (final e in cardinals.entries) {
      final angle = (e.value - 90) * math.pi / 180;
      final d = r - 28;
      final lx = cx + d * math.cos(angle);
      final ly = cy + d * math.sin(angle);
      final isNorth = e.key == 'U';
      tp.text = TextSpan(
        text: e.key,
        style: TextStyle(
          color: _black,
          fontWeight: isNorth ? FontWeight.w900 : FontWeight.w700,
          fontSize: isNorth ? 14 : 12,
          letterSpacing: 0,
        ),
      );
      tp.layout();
      // Underline North
      if (isNorth) {
        final underY = ly + tp.height / 2 + 2;
        canvas.drawLine(
          Offset(lx - 6, underY),
          Offset(lx + 6, underY),
          Paint()
            ..color = _black
            ..strokeWidth = 2,
        );
      }
      tp.paint(canvas, Offset(lx - tp.width / 2, ly - tp.height / 2));
    }

    // ── Qibla needle ────────────────────────────────────────────────────
    final qRad = (qiblaAngle - 90) * math.pi / 180;
    final tipDist = r * 0.85;
    final tailDist = r * 0.22;
    final qTip = Offset(
      cx + tipDist * math.cos(qRad),
      cy + tipDist * math.sin(qRad),
    );
    final qTail = Offset(
      cx - tailDist * math.cos(qRad),
      cy - tailDist * math.sin(qRad),
    );

    // Needle body — solid thick black line
    canvas.drawLine(
      qTail,
      qTip,
      Paint()
        ..color = _black
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.square,
    );

    // Arrowhead — small filled square rotated 45°
    canvas.save();
    canvas.translate(qTip.dx, qTip.dy);
    canvas.rotate(qRad + math.pi / 4);
    canvas.drawRect(
      Rect.fromCenter(center: Offset.zero, width: 10, height: 10),
      Paint()..color = _black,
    );
    canvas.restore();

    // Tail — smaller open square
    canvas.save();
    canvas.translate(qTail.dx, qTail.dy);
    canvas.rotate(qRad + math.pi / 4);
    canvas.drawRect(
      Rect.fromCenter(center: Offset.zero, width: 7, height: 7),
      Paint()
        ..color = _black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
    canvas.restore();

    // Label "KIBLAT" near tip (if space allows)
    final labelAngle = qRad + math.pi / 2;
    final lx = cx + (tipDist - 16) * math.cos(qRad) + 18 * math.cos(labelAngle);
    final ly = cy + (tipDist - 16) * math.sin(qRad) + 18 * math.sin(labelAngle);
    tp.text = const TextSpan(
      text: 'KIBLAT',
      style: TextStyle(
        color: _black,
        fontWeight: FontWeight.w900,
        fontSize: 7,
        letterSpacing: 1.5,
      ),
    );
    tp.layout();
    canvas.save();
    canvas.translate(lx, ly);
    canvas.rotate(qRad);
    tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
    canvas.restore();
  }

  @override
  bool shouldRepaint(_DialPainter o) => o.qiblaAngle != qiblaAngle;
}

// ─────────────────────────────────────────────────────────────────────────────
// No-sensor fallback
// ─────────────────────────────────────────────────────────────────────────────

class _NoCompass extends StatelessWidget {
  final double qiblaAngle;
  const _NoCompass({required this.qiblaAngle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(color: AppColors.black, width: 2.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'SENSOR',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              color: AppColors.grey600,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'TIDAK TERSEDIA',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: AppColors.grey400,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${qiblaAngle.toStringAsFixed(1)}°',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
              height: 1,
            ),
          ),
          const Text(
            'dari Utara',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.grey600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Stat widget
// ─────────────────────────────────────────────────────────────────────────────

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  final String sub;
  final TextAlign align;

  const _Stat({
    required this.label,
    required this.value,
    required this.sub,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: align == TextAlign.right
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: align,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              color: AppColors.grey600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            textAlign: align,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),
          Text(
            sub,
            textAlign: align,
            style: const TextStyle(fontSize: 10, color: AppColors.grey600),
          ),
        ],
      ),
    );
  }
}
