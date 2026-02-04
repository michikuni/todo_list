import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: _buildDefaultTextTheme(),
      useMaterial3: true,
      
      // colorScheme: darkColorScheme,
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

  
  // static ColorScheme darkColorScheme = ColorScheme(
    // brightness: Brightness.dark,  //Theme

    // primary: AppColors.mediumSlateBlue, //primary button, FAB
    // primaryContainer: , //card, selected item
    // primaryFixed: ,
    // primaryFixedDim: ,
    
    // onPrimary: AppColors.pureWhite,
    // onPrimaryContainer: ,
    // onPrimaryFixed: ,
    // onPrimaryFixedVariant: ,

    // secondary: , //secondary button, tag, chip, accent
    // secondaryContainer: ,
    // secondaryFixed: ,
    // secondaryFixedDim: ,

    // onSecondary: ,
    // onSecondaryContainer: ,
    // onSecondaryFixed: ,
    // onSecondaryFixedVariant: ,

    // tertiary: , //chart, badge, spot feature
    // tertiaryContainer: ,
    // tertiaryFixed: ,
    // tertiaryFixedDim: ,

    // onTertiary: ,
    // onTertiaryContainer: ,
    // onTertiaryFixed: ,
    // onTertiaryFixedVariant: ,

    // error: ,
    // errorContainer: ,

    // onError: ,
    // onErrorContainer: ,

    // surface: ,  //several surface
    // surfaceBright: , //background bright
    // surfaceContainer: , //card
    // surfaceContainerHigh: , //modal, dialog
    // surfaceContainerHighest: ,
    // surfaceContainerLow: ,
    // surfaceContainerLowest: ,
    // surfaceDim: , //background dark
    // surfaceTint: ,

    // onSurface: ,
    // onSurfaceVariant: ,

    // inversePrimary: , //snackbar, floating widget, overlay
    // inverseSurface: ,

    // onInverseSurface: ,

    // outline: , // border
    // outlineVariant: , //divider
    
    // scrim: ,
    // shadow: ,   
  // );
}
