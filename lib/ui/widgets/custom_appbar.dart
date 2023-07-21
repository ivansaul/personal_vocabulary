import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class CustomAppbarSecond extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leading;

  const CustomAppbarSecond({
    super.key,
    this.title = '',
    this.leading = Icons.keyboard_arrow_left_rounded,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.primaryColorLightGray,
      centerTitle: false,
      title: Text(
        title,
        style: GoogleFonts.lexend(
          color: AppTheme.primaryColorDarkGray,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          leading,
          size: 35,
          color: AppTheme.primaryColorDarkGray,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
