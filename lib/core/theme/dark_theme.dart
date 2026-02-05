import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class DarkTheme {
  static ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark, //Theme

    primary: AppColors.mediumSlateBlue, //primary button, FAB
    onPrimary: AppColors.pureWhite87,

    primaryContainer: AppColors.black, //background
    onPrimaryContainer: AppColors.darkGrey, //item on background

    primaryFixed: AppColors.mediumSlateBlue50, //disable button

    onPrimaryFixedVariant: AppColors.pureWhite50, //blur text note

    primaryFixedDim: AppColors.pureWhite, //highlight

    secondary: AppColors.jetBlack, // card highlight background
    onSecondary: AppColors.pureWhite10, //card background

    secondaryContainer: AppColors.pureWhite21, //container dropdown background
    onSecondaryContainer: AppColors.lightGrey, //dropdown background

    secondaryFixed: AppColors.eerieBlack, //button task
    secondaryFixedDim: AppColors.grey, //hint

    outline: AppColors.mediumGrey, // border
    outlineVariant: AppColors.mediumGrey, //divider

    error: AppColors.coralRed,
    onError: AppColors.pureWhite87, //chưa dùng đến

    surface: AppColors.darkGrey, //several surface (chưa dùng đến)
    onSurface: AppColors.pureWhite87, //chưa dùng đến

    // onSecondaryFixed: ,
    // onSecondaryFixedVariant: ,

    // onPrimaryFixed: ,

    // tertiary: , //chart, badge, spot feature
    // tertiaryContainer: ,
    // tertiaryFixed: ,
    // tertiaryFixedDim: ,

    // onTertiary: ,
    // onTertiaryContainer: ,
    // onTertiaryFixed: ,
    // onTertiaryFixedVariant: ,

    // errorContainer: ,
    // onErrorContainer: ,

    // surfaceBright: , //background bright
    // surfaceContainer: , //card
    // surfaceContainerHigh: , //modal, dialog
    // surfaceContainerHighest: ,
    // surfaceContainerLow: ,
    // surfaceContainerLowest: ,
    // surfaceDim: , //background dark
    // surfaceTint: ,

    // onSurfaceVariant: ,

    // inversePrimary: , //snackbar, floating widget, overlay
    // inverseSurface: ,

    // onInverseSurface: ,

    // scrim: ,
    // shadow: ,
  );
}
