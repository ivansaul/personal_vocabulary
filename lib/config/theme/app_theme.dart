import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
    );
  }

  // Primary Colors
  static const Color primaryColorGray = Color(0xFFC0BEBE);
  static const Color primaryColorLightGray = Color(0xFFDFDFDF);
  static const Color primaryColorDarkGray = Color(0xFF646464);
  static const Color primaryColorBlack = Color(0xFF030303);
  static const Color primaryColorWhite = Colors.white;

  // Text Style
  static TextStyle titleLargeTextStyle = GoogleFonts.lexend(
    color: AppTheme.primaryColorBlack,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle progressTextStyle = GoogleFonts.lexend(
    color: AppTheme.primaryColorBlack,
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
}
