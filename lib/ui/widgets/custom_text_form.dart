import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final String? errorText;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  const CustomTextForm({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.errorText,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 18,
      cursorColor: Colors.white,
      style: GoogleFonts.lexend(
        color: Colors.white,
        fontSize: 13,
      ),
      decoration: InputDecoration(
          suffixStyle: GoogleFonts.lexend(
            color: AppTheme.primaryColorWhite,
            fontSize: 13,
          ),
          labelText: labelText,
          labelStyle: GoogleFonts.lexend(
            color: AppTheme.primaryColorLightGray,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          errorText: errorText,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:  BorderSide(
              color: Colors.red.shade900,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 2,
            ),
          )),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
