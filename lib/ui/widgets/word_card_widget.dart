import 'package:flutter/material.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class WordCardWidget extends StatelessWidget {
  const WordCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primaryColorBlack.withOpacity(0.95),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Word',
            style: GoogleFonts.lexend(
              color: AppTheme.primaryColorWhite,
              fontSize: 16,
              fontWeight: FontWeight.w200,
            ),
          ),
          Row(
            children: [
              Text(
                'Pleasure',
                style: GoogleFonts.lexend(
                  color: AppTheme.primaryColorWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "[ˈpleʒər]",
                style: GoogleFonts.lexend(
                  color: AppTheme.primaryColorGray,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              CustomTextIconButton(
                text: 'Listen',
                icon: const Icon(Icons.volume_up_rounded),
                colorText: AppTheme.primaryColorBlack,
                color: AppTheme.primaryColorWhite,
                onTap: () {},
              ),
              const Spacer(),
              CustomTextIconButton(
                text: 'Wiew more',
                colorText: AppTheme.primaryColorBlack,
                color: AppTheme.primaryColorWhite,
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
