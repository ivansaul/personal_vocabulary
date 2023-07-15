import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColorLightGray,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColorLightGray,
        centerTitle: false,
        title: Text(
          'Category selection',
          style: GoogleFonts.lexend(
            color: AppTheme.primaryColorDarkGray,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 35,
            color: AppTheme.primaryColorDarkGray,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: ListView(
          children: [
            CustomListTile(
              iconColor: Colors.blue,
              leading: Icons.lightbulb_outline_rounded,
              trailing: Icons.keyboard_arrow_right_rounded,
              title: 'Oxford 5000 - A1',
              subtitle: '963 words',
              onTapTrailing: () {},
            ),
            const SizedBox(height: 10),
            CustomListTile(
              iconColor: Colors.blue,
              leading: Icons.lightbulb_outline_rounded,
              trailing: Icons.keyboard_arrow_right_rounded,
              title: 'Oxford 5000 - A2',
              subtitle: '963 words',
              onTapTrailing: () {},
            ),
          ],
        ),
      ),
    );
  }
}
