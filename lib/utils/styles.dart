import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'dimensions.dart';
import 'app_constants.dart';

class AppStyles {
  // TextStyle for headings
  static TextStyle headingTextStyle = TextStyle(
    fontSize: Dimensions.headingSize,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstants.fontFamily,
  );

  // TextStyle for body large text
  static TextStyle bodyLargeTextStyle = TextStyle(
    fontSize: Dimensions.bodyLargeSize,
    fontFamily: AppConstants.fontFamily,
  );

  // TextStyle for body medium text
  static TextStyle bodyMediumTextStyle = TextStyle(
    fontSize: Dimensions.bodyMediumSize,
    fontFamily: AppConstants.fontFamily,
  );

  // TextStyle for body small text
  static TextStyle bodySmallTextStyle = TextStyle(
    fontSize: Dimensions.bodySmallSize,
    fontFamily: AppConstants.fontFamily,
  );

  // BoxDecoration for cards or containers
  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(Dimensions.borderRadius),
    boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  // Button style
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, Dimensions.buttonHeight),
    backgroundColor: AppTheme.primary,
    foregroundColor: AppTheme.text,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.borderRadius),
    ),
  );

  // Input decoration (for TextFields)
  static InputDecoration inputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.borderRadius),
      borderSide: BorderSide(
        color: AppTheme.grey,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.borderRadius),
      borderSide: BorderSide(
        color: AppTheme.primary,
        width: 2,
      ),
    ),
    hintStyle: TextStyle(color: AppTheme.grey),
  );
}
