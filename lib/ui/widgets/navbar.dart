import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int visit = 0;
  double height = 30;
  Color colorSelect = AppTheme.primaryColorBlack;
  Color color = AppTheme.primaryColorDarkGray;
  @override
  Widget build(BuildContext context) {
    const List<TabItem> items = [
      TabItem(
        icon: Icons.home,
        title: 'Home',
      ),
      TabItem(
        icon: Icons.lightbulb_outline_rounded,
        title: 'Wishlist',
      ),
      TabItem(
        icon: Icons.settings,
        title: 'Settings',
      ),
    ];

    return BottomBarCreative(
      titleStyle: GoogleFonts.lexend(
        fontSize: 12,
        fontWeight: FontWeight.w500
      ),
      iconSize: 25,
      items: items,
      backgroundColor: AppTheme.primaryColorLightGray,
      color: color,
      colorSelected: colorSelect,
      indexSelected: visit,
      isFloating: false,
      highlightStyle: const HighlightStyle(
        sizeLarge: false,
        isHexagon: true,
        elevation: 2,
        background: AppTheme.primaryColorDarkGray,
      ),
      onTap: (int index) => setState(() {
        visit = index;
      }),
    );
  }
}
