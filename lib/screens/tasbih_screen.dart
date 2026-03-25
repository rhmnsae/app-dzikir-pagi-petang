import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_bar_helpers.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  int _target = 33;
  int _session = 0;
  final List<int> _presets = [33, 99, 100, 1000];

  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _bounceAnimation = Tween<double>(begin: 1.0, end: 0.92).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  Future<void> _tap() async {
    if (_count >= _target) return;
    HapticFeedback.lightImpact();
    _bounceController.forward().then((_) => _bounceController.reverse());
    try {
      final hasVibrator = await Vibration.hasVibrator();
      if (hasVibrator == true) Vibration.vibrate(duration: 20, amplitude: 48);
    } catch (_) {}
    setState(() {
      _count++;
      if (_count >= _target) {
        _session++;
        HapticFeedback.heavyImpact();
      }
    });
  }

  void _reset() => setState(() => _count = 0);
  void _resetAll() => setState(() { _count = 0; _session = 0; });

  @override
  Widget build(BuildContext context) {
    final progress = (_count / _target).clamp(0.0, 1.0);
    final done = _count >= _target;

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'TASBIH',
        actionLabel: 'RESET SEMUA',
        onAction: _resetAll,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.grey200,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.black),
            minHeight: 1.5,
          ),

          // ── Session info ────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppSectionLabel('SESI'),
                    const SizedBox(height: 4),
                    Text(
                      '${_count >= _target ? _session : _session + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  width: 1, height: 40, color: AppColors.grey400,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppSectionLabel('TOTAL'),
                    const SizedBox(height: 4),
                    Text(
                      '${(_session * _target) + (_count >= _target ? 0 : _count)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const AppSectionLabel('TARGET'),
                    const SizedBox(height: 4),
                    Text(
                      '$_target x',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const AppBlackLine(),

          // ── Presets ────────────────────────────────────────────
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const AppSectionLabel('PRESET  '),
                ..._presets.map((p) {
                  final selected = p == _target;
                  return GestureDetector(
                    onTap: () => setState(() { _target = p; _count = 0; _session = 0; }),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.black : Colors.transparent,
                        border: Border.all(color: AppColors.black, width: 1.5),
                      ),
                      child: Text(
                        '${p}x',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: selected ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          const AppDivider(),

          // ── Main counter ───────────────────────────────────────
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _bounceAnimation,
                    child: GestureDetector(
                      onTap: _tap,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: done ? AppColors.black : Colors.transparent,
                          border: Border.all(color: AppColors.black, width: 1.5),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$_count',
                              style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w900,
                                color: done ? AppColors.white : AppColors.black,
                              ),
                            ),
                            Text(
                              done ? 'SELESAI' : 'KETUK',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                                color: done ? AppColors.grey400 : AppColors.grey600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '$_count / $_target',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _reset,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black, width: 1.5),
                      ),
                      child: const Text(
                        'RESET SESI',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
