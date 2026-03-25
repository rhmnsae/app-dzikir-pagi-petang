import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/app_provider.dart';
import '../widgets/app_bar_helpers.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<AppProvider>();

    return Scaffold(
      appBar: buildAppBar(context: context, title: 'PENGATURAN'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Location ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSectionLabel('LOKASI'),
                const SizedBox(height: 8),
                Text(
                  prov.cityName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${prov.lat.toStringAsFixed(5)}°  ${prov.lon.toStringAsFixed(5)}°',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.grey400,
                  ),
                ),
                const SizedBox(height: 14),
                if (prov.locationLoading)
                  Row(
                    children: const [
                      SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Mendeteksi lokasi...',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.grey600,
                        ),
                      ),
                    ],
                  )
                else
                  GestureDetector(
                    onTap: () => prov.refreshLocation(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black, width: 1.5),
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'DETEKSI ULANG LOKASI GPS',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                              color: AppColors.black,
                            ),
                          ),
                          Text('→', style: TextStyle(color: AppColors.black)),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          const AppBlackLine(),

          // ── Notifications ──────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSectionLabel('NOTIFIKASI'),
                const SizedBox(height: 16),
                _buildToggle(
                  title: 'WAKTU ADZAN',
                  value: prov.adhanEnabled,
                  onTap: () => prov.toggleAdhan(!prov.adhanEnabled),
                ),
                if (prov.adhanEnabled) ...[
                  const SizedBox(height: 12),
                  _buildToggleText(
                    title: 'JENIS SUARA',
                    valueText: prov.useAdhanSound ? 'ADZAN' : 'BIASA',
                    onTap: () => prov.setUseAdhanSound(!prov.useAdhanSound),
                  ),
                  const SizedBox(height: 12),
                  if (prov.useAdhanSound) ...[
                    GestureDetector(
                      onTap: () => prov.testAudio(isSubuh: false),
                      child: _buildPlayButton(
                        'PREVIEW SUARA ADZAN',
                        prov.isPlayingAdzan,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => prov.testAudio(isSubuh: true),
                      child: _buildPlayButton(
                        'PREVIEW SUARA ADZAN SUBUH',
                        prov.isPlayingSubuh,
                      ),
                    ),
                  ] else ...[
                    GestureDetector(
                      onTap: () => prov.testBiasa(),
                      child: _buildPlayButton(
                        'PREVIEW NOTIFIKASI BIASA',
                        prov.isPlayingBiasa,
                      ),
                    ),
                  ],
                ],
                const SizedBox(height: 12),
                _buildToggle(
                  title: 'PENGINGAT DZIKIR',
                  value: prov.dzikirEnabled,
                  onTap: () => prov.toggleDzikir(!prov.dzikirEnabled),
                ),
              ],
            ),
          ),

          const Spacer(),
          const AppBlackLine(),

          // ── About ─────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppSectionLabel('TENTANG APLIKASI'),
                SizedBox(height: 10),
                Text(
                  'DZIKIR PAGI PETANG',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    letterSpacing: 1,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'v1.0.0',
                  style: TextStyle(fontSize: 11, color: AppColors.grey400),
                ),
                SizedBox(height: 14),
                Text(
                  'Konten dzikir pagi & petang bersumber dari Rumaysho.com.',
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.6,
                    color: AppColors.grey600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Developer saepl.',
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.6,
                    color: AppColors.grey600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggle({
    required String title,
    required bool value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 1.5),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: AppColors.black,
              ),
            ),
            Text(
              value ? 'AKTIF  ✓' : 'NONAKTIF',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: value ? AppColors.black : AppColors.grey400,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleText({
    required String title,
    required String valueText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 1.5),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: AppColors.black,
              ),
            ),
            Text(
              valueText,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: AppColors.black,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayButton(String title, bool isPlaying) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black, width: 1.5),
        color: isPlaying ? AppColors.grey200 : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: AppColors.black,
            ),
          ),
          Text(
            isPlaying ? '■' : '▶',
            style: const TextStyle(fontSize: 14, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
