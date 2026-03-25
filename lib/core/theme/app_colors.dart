import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF303841);
  static const Color white = Color(0xFFF5F5F5);

  static const Color grey800 = Color(0xFF424242);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey200 = Color(0xFFDDDDDD);
  static const Color grey100 = Color(0xFFEEEEEE);

  static const Color arabicText = black;

  // Semantic aliases
  static const Color backgroundPrimary = white;
  static const Color backgroundSecondary = grey100;
  static const Color backgroundCard = white;
  static const Color textPrimary = black;
  static const Color textSecondary = grey600;
  static const Color border = black;

  // Legacy aliases — yellow removed, mapped to black or grey
  static const Color yellow = black;
  static const Color yellowLight = grey100;
  static const Color success = black;
  static const Color error = black;
  static const Color accent = black;
}
