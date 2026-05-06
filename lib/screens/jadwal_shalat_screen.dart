import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/app_provider.dart';
import '../services/prayer_time_service.dart';
import '../widgets/app_bar_helpers.dart';

class JadwalShalatScreen extends StatelessWidget {
  const JadwalShalatScreen({super.key});

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
    final nextName = nextPrayer?.name ?? '';
    final countdown = PrayerTimeService.countdown(nextPrayer?.time);
    final prayers = pt != null
        ? PrayerTimeService.getAllTimes(pt)
        : <String, DateTime?>{};

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'JADWAL SHALAT',
        actionLabel: 'PERBARUI',
        onAction: () => prov.refreshLocation(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Countdown section ────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSectionLabel('SHALAT BERIKUTNYA'),
                const SizedBox(height: 6),
                Text(
                  nextName.isEmpty
                      ? '--'
                      : nextPrayer?.isTomorrow == true
                      ? '$nextName BESOK'
                      : nextName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  countdown != null
                      ? '${countdown.inHours.toString().padLeft(2, '0')} : ${(countdown.inMinutes % 60).toString().padLeft(2, '0')} : ${(countdown.inSeconds % 60).toString().padLeft(2, '0')}'
                      : '--:--:--',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 38,
                    letterSpacing: 4,
                    color: AppColors.black,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const AppSectionLabel('LOKASI  '),
                    Text(
                      prov.cityName,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.grey600,
                      ),
                    ),
                    if (prov.locationLoading) ...[
                      const SizedBox(width: 8),
                      const SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const AppBlackLine(),

          // ── Prayer list ──────────────────────────────────────────
          Expanded(
            child: pt == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.black,
                      strokeWidth: 1.5,
                    ),
                  )
                : ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ...prayers.entries.map((e) {
                        final isNext = e.key == nextName;
                        final isTodayNext =
                            isNext && nextPrayer?.isTomorrow == false;
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: isTodayNext
                                ? AppColors.black
                                : Colors.transparent,
                            border: const Border(
                              bottom: BorderSide(
                                color: AppColors.grey200,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.key,
                                style: TextStyle(
                                  fontWeight: isNext
                                      ? FontWeight.w900
                                      : FontWeight.w500,
                                  fontSize: 15,
                                  color: isTodayNext
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                              Text(
                                PrayerTimeService.formatTime(e.value),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: isTodayNext
                                      ? AppColors.grey400
                                      : AppColors.grey600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 32),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
