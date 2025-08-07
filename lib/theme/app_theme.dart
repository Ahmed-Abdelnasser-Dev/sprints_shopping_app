import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF212529);
  static const Color primary = Color(0xFF495057);
  static const Color secondary = Color(0xFF6C757D);
  static const Color accent = Color(0xFF6C757D);
  static const Color textPrimary = Color(0xFFF8F9FA);
  static const Color textSecondary = Color(0xFFDEE2E6);
  static const Color error = Color(0xFFE57373);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Suwannaphum',
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: surface,
      error: error,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      iconTheme: IconThemeData(color: textPrimary),
      titleTextStyle: TextStyle(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      color: surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      margin: EdgeInsets.all(8),
    ),
    iconTheme: const IconThemeData(color: secondary),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: textPrimary, fontSize: 28, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          color: textPrimary, fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          color: textPrimary, fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          color: textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          color: textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: textPrimary, fontSize: 14),
      titleMedium: TextStyle(color: textPrimary, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(color: textSecondary, fontSize: 14),
      labelLarge: TextStyle(color: textSecondary, fontSize: 14),
      bodySmall: TextStyle(color: textSecondary, fontSize: 12),
      labelSmall: TextStyle(color: textSecondary, fontSize: 10),
    ),
    dividerColor: const Color(0xFF343A40),
    hintColor: textSecondary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: textPrimary,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: textPrimary,
        side: BorderSide(color: accent),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accent,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromRGBO(33, 37, 41, 0.7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: TextStyle(color: textSecondary),
      labelStyle: TextStyle(color: textSecondary),
    ),
  );
}
