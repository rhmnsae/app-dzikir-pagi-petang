import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../data/dzikir_pagi_data.dart';
import '../data/dzikir_petang_data.dart';
import '../providers/app_provider.dart';
import '../widgets/app_bar_helpers.dart';
import '../widgets/grid_background.dart';
import 'dzikir_detail_screen.dart';

class DzikirListScreen extends StatelessWidget {
  final bool isPagi;
  const DzikirListScreen({super.key, required this.isPagi});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<AppProvider>();
    final dzikirs = isPagi ? dzikirPagiList : dzikirPetangList;
    final counters = isPagi ? prov.pagiCounters : prov.petangCounters;
    final completed = dzikirs
        .where((d) {
          final idx = dzikirs.indexOf(d);
          return counters[idx] >= d.repeatCount;
        })
        .length;
    final progressVal = (completed / dzikirs.length).clamp(0.0, 1.0);

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: isPagi ? 'DZIKIR PAGI' : 'DZIKIR PETANG',
        actionLabel: 'RESET',
        onAction: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 24),
              elevation: 0,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.white,
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Reset Progress?',
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Semua hitungan ${isPagi ? "dzikir pagi" : "dzikir petang"} akan direset.',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('BATAL',
                                    style: TextStyle(
                                        color: AppColors.grey600,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1)),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () {
                                  if (isPagi) prov.resetAllPagi();
                                  else prov.resetAllPetang();
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                child: const Text('RESET',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      body: Column(
        children: [
          // ── Progress strip ──────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSectionLabel('PROGRES'),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$completed / ${dzikirs.length} selesai',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      '${(progressVal * 100).round()}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progressVal,
                  backgroundColor: AppColors.grey200,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.black),
                  minHeight: 1.5,
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const AppBlackLine(),

          // ── List ────────────────────────────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: dzikirs.length,
              itemBuilder: (context, index) {
                final dzikir = dzikirs[index];
                final counter = counters[index];
                final done = counter >= dzikir.repeatCount;
                final progress =
                    (counter / dzikir.repeatCount).clamp(0.0, 1.0);

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider.value(
                        value: prov,
                        child: DzikirDetailScreen(
                          isPagi: isPagi,
                          initialIndex: index,
                        ),
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: done ? AppColors.grey100.withValues(alpha: 0.8) : Colors.transparent,
                      border: const Border(
                        bottom: BorderSide(color: AppColors.grey200, width: 1),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 28,
                                child: Text(
                                  '${dzikir.number}.',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: done
                                        ? AppColors.grey400
                                        : AppColors.grey400,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dzikir.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: done
                                            ? AppColors.grey600
                                            : AppColors.black,
                                        decoration: done
                                            ? TextDecoration.lineThrough
                                            : null,
                                        decorationColor: AppColors.grey400,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      dzikir.arabic,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Scheherazade New',
                                        height: 1.8,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '$counter/${dzikir.repeatCount}x',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                  color: done
                                      ? AppColors.black
                                      : AppColors.grey400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!done)
                          LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.transparent,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.black),
                            minHeight: 1,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          int startIndex = 0;
          for (int i = 0; i < dzikirs.length; i++) {
            if (counters[i] < dzikirs[i].repeatCount) {
              startIndex = i;
              break;
            }
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                value: prov,
                child: DzikirDetailScreen(
                  isPagi: isPagi,
                  initialIndex: startIndex,
                ),
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.black,
            border: Border.all(color: AppColors.black, width: 1.5),
          ),
          child: const Text(
            'MULAI BERURUTAN',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w900,
              fontSize: 12,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
