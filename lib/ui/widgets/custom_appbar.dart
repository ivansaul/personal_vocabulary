import 'package:flutter/material.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';

class CustomAppbar extends StatelessWidget {
  final IconData leading;
  final IconData trailing;

  const CustomAppbar({
    super.key,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: Icon(
            leading,
            size: 18,
          ),
          onTap: () {},
        ),
        const Spacer(),
        CustomIconButton(
          icon: const Icon(Icons.bookmark),
          onTap: () {},
        ),
      ],
    );
  }
}
