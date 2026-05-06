import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/app_provider.dart';
import '../services/prayer_time_service.dart';
import '../data/dzikir_pagi_data.dart';
import '../data/dzikir_petang_data.dart';
import '../widgets/app_bar_helpers.dart';
import 'dzikir_list_screen.dart';
import 'jadwal_shalat_screen.dart';
import 'kalender_islam_screen.dart';
import 'tasbih_screen.dart';
import 'doa_harian_screen.dart';
import 'doa_nabi_screen.dart';
import 'qibla_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  bool get _isPagiTime {
    final h = DateTime.now().hour;
    return h >= 4 && h < 12;
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<AppProvider>();
    final pt = prov.prayerTimes;
    final nextPrayer = pt != null
        ? PrayerTimeService.getNextPrayerInfo(
            lat: prov.lat,
            lon: prov.lon,
            methodIndex: prov.storage.getCalculationMethod(),
            now: prov.now,
          )
        : null;
    final nextName = nextPrayer?.name ?? '--';
    final nextTime = nextPrayer?.time;
    final countdown = PrayerTimeService.countdown(nextTime);
    final countdownStr = PrayerTimeService.formatCountdown(countdown);

    final pagiDone = prov.pagiCounters
        .where(
          (c) => c >= dzikirPagiList[prov.pagiCounters.indexOf(c)].repeatCount,
        )
        .length;
    final petangDone = prov.petangCounters
        .where(
          (c) =>
              c >= dzikirPetangList[prov.petangCounters.indexOf(c)].repeatCount,
        )
        .length;

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'DZIKIR PAGI PETANG',
        actionLabel: 'PENGATURAN',
        hideBack: true,
        onAction: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: prov,
              child: const SettingsScreen(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ─── Header TANGGAL ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSectionLabel('TANGGAL'),
                  const SizedBox(height: 6),
                  Text(
                    prov.hijriDate,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    prov.masehibDate,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.grey600,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Next prayer strip
                  Row(
                    children: [
                      AppSectionLabel(
                        nextName.isEmpty
                            ? '--'
                            : nextPrayer?.isTomorrow == true
                            ? '$nextName BESOK'
                            : nextName,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          countdownStr,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      if (nextTime != null)
                        Text(
                          nextPrayer?.isTomorrow == true
                              ? '${PrayerTimeService.formatTime(nextTime)} besok'
                              : PrayerTimeService.formatTime(nextTime),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.grey600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const AppBlackLine(),

            // ─── Body ────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 4),

                  // ─── Main Dzikir Buttons ─────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: _DzikirMainButton(
                          label: 'DZIKIR\nPAGI',
                          subtitle:
                              '$pagiDone / ${dzikirPagiList.length} selesai',
                          progress: pagiDone / dzikirPagiList.length,
                          isActive: _isPagiTime,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider.value(
                                value: prov,
                                child: const DzikirListScreen(isPagi: true),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _DzikirMainButton(
                          label: 'DZIKIR\nPETANG',
                          subtitle:
                              '$petangDone / ${dzikirPetangList.length} selesai',
                          progress: petangDone / dzikirPetangList.length,
                          isActive: !_isPagiTime,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider.value(
                                value: prov,
                                child: const DzikirListScreen(isPagi: false),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const AppBlackLine(),
                  const SizedBox(height: 16),

                  // ─── Features ────────────────────────────────────
                  const AppSectionLabel('FITUR LAINNYA'),
                  const SizedBox(height: 12),
                  _FeatureRow(
                    label: 'Jadwal Shalat',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider.value(
                          value: prov,
                          child: const JadwalShalatScreen(),
                        ),
                      ),
                    ),
                  ),
                  _FeatureRow(
                    label: 'Kalender Islam',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const KalenderIslamScreen(),
                      ),
                    ),
                  ),
                  _FeatureRow(
                    label: 'Tasbih Digital',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TasbihScreen()),
                    ),
                  ),
                  _FeatureRow(
                    label: 'Doa Harian',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DoaHarianScreen(),
                      ),
                    ),
                  ),
                  _FeatureRow(
                    label: 'Doa Para Nabi',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DoaNabiScreen()),
                    ),
                  ),
                  _FeatureRow(
                    label: 'Arah Kiblat',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider.value(
                          value: prov,
                          child: const QiblaScreen(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const AppBlackLine(),
                  const SizedBox(height: 24),

                  // ─── Embedded Jadwal Shalat ──────────────────────
                  const AppSectionLabel('JADWAL SHALAT HARI INI'),
                  const SizedBox(height: 4),
                  Text(
                    prov.cityName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800,
                      color: AppColors.grey600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  if (pt != null)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black, width: 1.5),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        children: PrayerTimeService.getAllTimes(pt).entries.map(
                          (e) {
                            final isNext =
                                e.key == nextName &&
                                nextPrayer?.isTomorrow == false;
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.grey200,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e.key,
                                    style: TextStyle(
                                      fontWeight: isNext
                                          ? FontWeight.w900
                                          : FontWeight.w600,
                                      fontSize: 13,
                                      color: isNext
                                          ? AppColors.black
                                          : AppColors.grey800,
                                    ),
                                  ),
                                  Text(
                                    PrayerTimeService.formatTime(e.value),
                                    style: TextStyle(
                                      fontWeight: isNext
                                          ? FontWeight.w900
                                          : FontWeight.w700,
                                      fontSize: 13,
                                      color: isNext
                                          ? AppColors.black
                                          : AppColors.grey600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    )
                  else
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Menunggu lokasi...',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.grey600,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DzikirMainButton extends StatelessWidget {
  final String label;
  final String subtitle;
  final double progress;
  final bool isActive;
  final VoidCallback onTap;

  const _DzikirMainButton({
    required this.label,
    required this.subtitle,
    required this.progress,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isActive ? AppColors.black : Colors.transparent,
          border: Border.all(color: AppColors.black, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                letterSpacing: 1.5,
                height: 1.3,
                color: isActive ? AppColors.white : AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isActive ? AppColors.grey400 : AppColors.grey600,
              ),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              backgroundColor: isActive ? AppColors.grey600 : AppColors.grey200,
              valueColor: AlwaysStoppedAnimation<Color>(
                isActive ? AppColors.white : AppColors.black,
              ),
              minHeight: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _FeatureRow({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.grey200, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
            const Text(
              '→',
              style: TextStyle(fontSize: 14, color: AppColors.grey400),
            ),
          ],
        ),
      ),
    );
  }
}
