import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/theme/color_pallete.dart';

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorPallete.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(size: 30, color: ColorPallete.generalTextColor),
      titleTextStyle: TextStyle(
        fontFamily: "Inter",
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorPallete.generalTextColor,
      ),
    ),
    fontFamily: "Inter",
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontFamily: "Inter",
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ColorPallete.generalTextColor,
      ),
      titleLarge: TextStyle(
        fontFamily: "Inter",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorPallete.generalTextColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Inter",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorPallete.generalTextColor,
      ),
      titleSmall: TextStyle(
        fontFamily: "Inter",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorPallete.generalTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Inter",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorPallete.generalTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Inter",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: ColorPallete.generalTextColor,
      ),
    ),
  );
}
