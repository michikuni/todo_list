import 'package:flutter/material.dart';
import 'package:todo_list/core/constants/app_colors.dart';

class LightTheme {
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light, // Theme

    primary: const Color(0xFFFF877D),

    onPrimary: Color(0xFF651B40),

    primaryContainer: Color(0xFFEDE7D3), // background
    onPrimaryContainer: const Color(0xFFFFC4AE), // item on background

    primaryFixed: const Color(0xFFFFD1D1), // disable button

    onPrimaryFixedVariant: Color(0x00000080), // blur text note

    primaryFixedDim: Colors.white, // highlight

    secondary: const Color.fromARGB(255, 255, 255, 255), // card highlight background
    onSecondary: AppColors.lightGrey, // card background

    secondaryContainer: Color(0xFFF5F5F5), // container dropdown background
    onSecondaryContainer: Color(0xFFFFFFFF), // dropdown text/icon

    secondaryFixed: const Color(0xFFFFC4AE), // button task
    secondaryFixedDim: AppColors.darkGrey, // hint

    outline: AppColors.grey, // border
    outlineVariant: AppColors.lightGrey, // divider
    
    error: AppColors.coralRed, // Giữ nguyên
    onError: AppColors.pureWhite, // Text trên nền đỏ

    surface: AppColors.pureWhite, // several surface
    onSurface: AppColors.jetBlack, // Text chính màu đen
  );
}
