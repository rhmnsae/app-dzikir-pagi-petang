import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/app_provider.dart';
import '../services/notification_service.dart';
import '../widgets/app_bar_helpers.dart';
import 'home_screen.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool _locationGranted = false;
  bool _notifGranted = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _checkInitial();
  }

  Future<void> _checkInitial() async {
    final loc = await Geolocator.checkPermission();
    final notif = await NotificationService().areNotificationsEnabled();
    if (mounted) {
      setState(() {
        _locationGranted =
            loc == LocationPermission.always ||
            loc == LocationPermission.whileInUse;
        _notifGranted = notif;
      });
    }
  }

  Future<void> _requestLocation() async {
    setState(() => _loading = true);
    bool svcEnabled = await Geolocator.isLocationServiceEnabled();
    if (!svcEnabled) {
      await Geolocator.openLocationSettings();
      setState(() => _loading = false);
      return;
    }
    var perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) {
      perm = await Geolocator.requestPermission();
    }
    if (mounted) {
      setState(() {
        _locationGranted =
            perm == LocationPermission.always ||
            perm == LocationPermission.whileInUse;
        _loading = false;
      });
    }
  }

  Future<void> _requestNotif() async {
    setState(() => _loading = true);
    final granted = await NotificationService().requestPermissions();
    if (!granted && await Permission.notification.isPermanentlyDenied) {
      await openAppSettings();
    }
    if (granted && mounted) {
      final provider = context.read<AppProvider>();
      await provider.toggleAdhan(true);
      await provider.toggleDzikir(true);
    }
    if (mounted) {
      setState(() => _notifGranted = granted);
    }
    if (mounted) setState(() => _loading = false);
  }

  void _proceed() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),

              // ── Header ─────────────────────────────────────────────
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black, width: 2),
                ),
                child: const Column(
                  children: [
                    Text(
                      'DZIKIR\nPAGI PETANG',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                        height: 1.4,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Agar aplikasi berfungsi optimal,\nmohon berikan izin berikut ini.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey600,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ── Permissions ─────────────────────────────────────────
              const AppSectionLabel('IZIN YANG DIPERLUKAN'),
              const SizedBox(height: 14),

              // Location permission tile
              _PermissionTile(
                icon: '[LOC]',
                title: 'LOKASI (GPS)',
                desc:
                    'Digunakan untuk menampilkan jadwal sholat yang akurat sesuai lokasi Anda dan menentukan arah kiblat.',
                granted: _locationGranted,
                onTap: _locationGranted ? null : _requestLocation,
              ),

              const SizedBox(height: 12),

              // Notification permission tile
              _PermissionTile(
                icon: '[NOTIF]',
                title: 'NOTIFIKASI',
                desc:
                    'Digunakan untuk mengirimkan pengingat adzan dan pengingat dzikir pagi/petang.',
                granted: _notifGranted,
                onTap: _notifGranted ? null : _requestNotif,
              ),

              const Spacer(),

              // ── Proceed Button ──────────────────────────────────────
              GestureDetector(
                onTap: _loading ? null : _proceed,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: _locationGranted && _notifGranted
                        ? AppColors.black
                        : AppColors.grey200,
                    border: Border.all(color: AppColors.black, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _locationGranted && _notifGranted
                        ? 'MULAI APLIKASI'
                        : 'LEWATI → MASUK APLIKASI',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      color: _locationGranted && _notifGranted
                          ? AppColors.white
                          : AppColors.grey600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                'Anda dapat mengubah izin kapan saja melalui Pengaturan HP.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: AppColors.grey400),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final bool granted;
  final VoidCallback? onTap;

  const _PermissionTile({
    required this.icon,
    required this.title,
    required this.desc,
    required this.granted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: granted ? AppColors.black : AppColors.grey200,
          width: granted ? 2 : 1.5,
        ),
        color: granted ? AppColors.black : Colors.transparent,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Status indicator
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: granted ? AppColors.white : AppColors.grey400,
                width: 1.5,
              ),
            ),
            child: Text(
              granted ? '✓' : '?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: granted ? AppColors.white : AppColors.grey400,
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Title + description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: granted ? AppColors.white : AppColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.5,
                    color: granted ? AppColors.grey400 : AppColors.grey600,
                  ),
                ),
                if (!granted) ...[
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: const BoxDecoration(color: AppColors.black),
                      child: const Text(
                        'IZINKAN',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
