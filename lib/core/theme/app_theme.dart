import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryPurple,
        primary: AppColors.primaryPurple,
        secondary: AppColors.secondaryPurple,
        surface: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.white,
      textTheme: GoogleFonts.interTextTheme().copyWith(
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
          height: 1.1,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
          height: 1.2,
        ),
        headlineSmall: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
          height: 1.3,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.grayText,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.grayText,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
