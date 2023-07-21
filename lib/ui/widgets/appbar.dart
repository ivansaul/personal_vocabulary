import 'package:flutter/material.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../config/theme/app_theme.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 35,
            color: AppTheme.primaryColorDarkGray,
          ),
          onTap: () {
            context.pop();
          },
        ),
        const Spacer(),
        CustomIconButton(
          icon: const Icon(
            Icons.favorite_border_rounded,
            color: AppTheme.primaryColorDarkGray,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
