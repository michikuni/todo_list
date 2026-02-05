import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/constants/app_colors.dart';
import 'package:todo_list/core/theme/dark_theme.dart';
import 'package:todo_list/core/theme/light_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: _buildDefaultTextTheme(),
      useMaterial3: true,
      colorScheme: DarkTheme.darkColorScheme,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: _buildDefaultTextTheme(),
      useMaterial3: true,
      colorScheme: LightTheme.lightColorScheme,
    );
  }

  static TextTheme _buildDefaultTextTheme() {
    return GoogleFonts.nunitoTextTheme().copyWith(
      headlineLarge: GoogleFonts.nunito(
        textStyle: TextStyle(color: AppColors.pureWhite87),
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
      bodyLarge: GoogleFonts.nunito(
        textStyle: TextStyle(color: AppColors.pureWhite87),
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
      bodyMedium: GoogleFonts.nunito(
        textStyle: TextStyle(color: AppColors.pureWhite87),
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
      bodySmall: GoogleFonts.nunito(
        textStyle: TextStyle(color: AppColors.pureWhite87),
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      displayLarge: GoogleFonts.nunito(
        textStyle: TextStyle(color: AppColors.pureWhite87),
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      displayMedium: GoogleFonts.nunito(
        textStyle: TextStyle(color: AppColors.pureWhite87),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      displaySmall: GoogleFonts.nunito(
        textStyle: TextStyle(color: AppColors.pureWhite87),
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      labelSmall: GoogleFonts.nunito(
        textStyle: TextStyle(color: AppColors.pureWhite87),
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
    );
  }
}
