import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

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
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: colorText),
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
