import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF4F3CC9); // #4F3CC9
  static const Color secondary = Color(0xFF5450B4); // #5450B4
  static const Color surface = Color(0xFFFFFFFF); // #DFE1EF
  static const Color text = Color(0xFFFFFFFF); // #FFFFFF
  static const Color black = Colors.black; // Black color
  static const Color grey = Colors.grey;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true, // Enable Material Design 3
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: surface,
        onSurface: black,
      ),
      scaffoldBackgroundColor: surface, // Use `surface` instead of `background`
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: black,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: black,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: text,
        titleTextStyle: TextStyle(
          color: text,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: text,
        ),
      ),
    );
  }
}
