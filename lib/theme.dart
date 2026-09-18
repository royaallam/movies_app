import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF151515);
  static const surface = Color(0xFF1D1D1D);
  static const surface2 = Color(0xFF242424);
  static const yellow = Color(0xFFFFC400);
  static const red = Color(0xFFFF2D2D);
  static const white = Color(0xFFF7F7F7);
  static const muted = Color(0xFF9B9B9B);
}

ThemeData movieTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.yellow,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
  );
}
