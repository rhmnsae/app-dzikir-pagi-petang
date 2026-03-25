import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    const defaultFont = 'Cascadia Mono';

    TextStyle tStyle(double size, FontWeight weight,
        [Color color = AppColors.black]) {
      return TextStyle(
        fontFamily: defaultFont,
        fontSize: size,
        fontWeight: weight,
        color: color,
      );
    }

    return ThemeData(
      useMaterial3: true,
      fontFamily: defaultFont,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.black,
        primary: AppColors.black,
        onPrimary: AppColors.white,
        secondary: AppColors.white,
        onSecondary: AppColors.black,
        surface: AppColors.white,
        onSurface: AppColors.black,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        displayLarge: tStyle(48, FontWeight.w900).copyWith(letterSpacing: -1),
        displayMedium: tStyle(36, FontWeight.w800),
        headlineLarge: tStyle(28, FontWeight.w800),
        headlineMedium: tStyle(22, FontWeight.w700),
        headlineSmall: tStyle(18, FontWeight.w700),
        titleLarge: tStyle(16, FontWeight.w700),
        bodyLarge: tStyle(16, FontWeight.w400).copyWith(height: 1.6),
        bodyMedium: tStyle(14, FontWeight.w400).copyWith(height: 1.5),
        bodySmall: tStyle(12, FontWeight.w400, AppColors.grey600),
        labelLarge: tStyle(14, FontWeight.w700).copyWith(letterSpacing: 0.5),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.black,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: false,
        titleTextStyle: tStyle(17, FontWeight.w900),
        iconTheme: const IconThemeData(color: AppColors.black, size: 22),
        shape: const Border(
          bottom: BorderSide(color: AppColors.black, width: 1.5),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(color: AppColors.black, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(color: AppColors.black, width: 1.5),
          ),
          textStyle: tStyle(14, FontWeight.w700, AppColors.white),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          side: const BorderSide(color: AppColors.black, width: 1.5),
          textStyle: tStyle(14, FontWeight.w600),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.grey200,
        thickness: 1,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.grey400,
        selectedLabelStyle: tStyle(11, FontWeight.w700),
        unselectedLabelStyle: tStyle(11, FontWeight.w400),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: _NoAnimationPageTransitionsBuilder(),
          TargetPlatform.iOS: _NoAnimationPageTransitionsBuilder(),
        },
      ),
    );
  }
}

class _NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
