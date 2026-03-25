import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// Returns a consistent AppBar matching the Qibla-screen design language:
/// - White background, no elevation
/// - "←" text back button (no icon)
/// - ALL CAPS title with letterSpacing: 2
/// - Optional text action (e.g., "PERBARUI", "RESET")
PreferredSizeWidget buildAppBar({
  required BuildContext context,
  required String title,
  String? actionLabel,
  VoidCallback? onAction,
  bool hideBack = false,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.black,
    elevation: 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leading: hideBack
        ? null
        : GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Center(
              child: Text(
                '←',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
        color: AppColors.black,
      ),
    ),
    actions: actionLabel != null
        ? [
            GestureDetector(
              onTap: onAction,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    actionLabel,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ]
        : null,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.5),
      child: Container(height: 1.5, color: AppColors.black),
    ),
  );
}

/// Small ALL-CAPS section label like "LOKASI", "ARAH KIBLAT"
class AppSectionLabel extends StatelessWidget {
  final String text;
  const AppSectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 9,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
        color: AppColors.grey600,
      ),
    );
  }
}

/// Thin horizontal line separator
class AppDivider extends StatelessWidget {
  final Color color;
  final double thickness;
  const AppDivider({
    super.key,
    this.color = AppColors.grey200,
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: thickness, color: color);
  }
}

/// Thick black separator line
class AppBlackLine extends StatelessWidget {
  const AppBlackLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1.5, color: AppColors.black);
  }
}
