import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final double size;
  final double borderRadius;
  final void Function()? onTap;

  const CustomButton(
      {super.key,
      required this.icon,
      this.color = AppTheme.backgroundWhite,
      this.size = 45,
      this.borderRadius = 15,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: size,
            width: size,
            child: icon,
          ),
        ),
      ),
    );
  }
}
