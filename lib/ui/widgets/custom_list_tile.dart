import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color iconColor;
  final IconData leading;
  final IconData? trailing;
  final void Function()? onTap;
  final void Function()? onTapTrailing;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconColor = AppTheme.primaryColorDarkGray,
    required this.leading,
    this.trailing,
    this.onTap,
    this.onTapTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.primaryColorBlack.withOpacity(0.2), width: 2),
                color: AppTheme.primaryColorWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ]),
            child: Row(
              children: [
                Icon(
                  leading,
                  color: iconColor,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.lexend(
                          color: AppTheme.primaryColorBlack.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.lexend(
                          color: AppTheme.primaryColorGray,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (trailing != null)
                  IconButton(
                    icon: Icon(
                      trailing,
                      color: AppTheme.primaryColorDarkGray,
                    ),
                    onPressed: onTapTrailing,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
