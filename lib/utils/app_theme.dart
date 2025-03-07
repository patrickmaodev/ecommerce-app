import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'dimensions.dart';

class AppTheme {
  static const Color primary = Color(0xFF4F3CC9);
  static const Color secondary = Color(0xFF5450B4);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color text = Color(0xFFFFFFFF);
  static const Color black = Colors.black;

  // Grey shades
  static const Color grey = Color(0xFFB0BEC5);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey800 = Color(0xFF424242);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: surface,
        onSurface: black,
      ),
      scaffoldBackgroundColor: surface,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: Dimensions.headingSize,
          fontWeight: FontWeight.bold,
          color: black,
        ),
        displayMedium: TextStyle(
          fontSize: Dimensions.subHeadingSize,
          fontWeight: FontWeight.w600,
          color: black,
        ),
        bodyLarge: TextStyle(
          fontSize: Dimensions.bodyLargeSize,
          color: black,
        ),
        bodyMedium: TextStyle(
          fontSize: Dimensions.bodyMediumSize,
          color: black,
        ),
        bodySmall: TextStyle(
          fontSize: Dimensions.bodySmallSize,
          color: grey800,
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
          padding: const EdgeInsets.symmetric(
            vertical: Dimensions.paddingMedium,
            horizontal: Dimensions.paddingLarge,
          ),
        ),
      ),
    );
  }
}
