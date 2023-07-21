import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextIconButton extends StatelessWidget {
  final String text;
  final Color colorText;
  final Icon? icon;
  final Color color;
  final double height;
  final double borderRadius;
  final void Function() onTap;

  const CustomTextIconButton({
    super.key,
    required this.text,
    this.icon,
    this.color = AppTheme.primaryColorBlack,
    this.colorText = AppTheme.primaryColorWhite,
    this.height = 45,
    this.borderRadius = 15,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.lexend(
                        color: colorText.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    if (icon != null) const SizedBox(width: 5),
                    if (icon != null) icon!
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
