import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  final double size;
  final double borderRadius;

  const CustomCard(
      {super.key,
      required this.title,
      required this.content,
      this.color = AppTheme.backgroundWhite,
      this.size = 140,
      this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(content),
        ),
      ),
    );
  }
}
