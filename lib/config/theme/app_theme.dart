import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
    );
  }

  // Background Color
  static const Color backgroundWhite = Color(0x3DFFFFFF);
  static const Color backgroundLightGrey = Color(0xFFDFDFDF);
  static const Color backgroundBlack = Color(0xFF030303);
  static const Color backgroundGrey = Color(0xFFC0BEBE);
  static const Color backgroundDarkGrey = Color(0xFF646464);
}
