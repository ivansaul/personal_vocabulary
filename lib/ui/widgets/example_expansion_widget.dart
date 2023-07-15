import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class ExampleExpansionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const ExampleExpansionWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      shape: const StadiumBorder(),
      iconColor: AppTheme.primaryColorGray,
      collapsedIconColor: AppTheme.primaryColorDarkGray,
      childrenPadding: const EdgeInsets.only(bottom: 15, left: 55, right: 20),
      expandedAlignment: Alignment.centerLeft,
      title: Text(
        title,
        style: GoogleFonts.lexend(
          fontSize: 14,
          color: AppTheme.primaryColorBlack.withOpacity(0.9),
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.play_circle_fill_rounded),
      ),
      children: [
        Text(
          subtitle,
          style: GoogleFonts.lexend(
            fontSize: 12,
            color: AppTheme.primaryColorDarkGray,
          ),
        )
      ],
    );
  }
}
