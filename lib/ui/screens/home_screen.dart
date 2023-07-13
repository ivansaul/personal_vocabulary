import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/ui/screens/test_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColorLightGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              const _AppbarView(),
              const SizedBox(height: 50),
              Text(
                'Good evening, Saul!',
                style: AppTheme.titleExtaLargeTextStyle,
              ),
              const SizedBox(height: 10),
              const ProgressWidget(progress: 0.25),
              const SizedBox(height: 50),
              Text(
                'Practice English',
                style: AppTheme.titleExtaLargeTextStyle,
              ),
              Text(
                'You hace new words!',
                style: AppTheme.subTitleLargeTextStyle,
              ),
              const SizedBox(height: 10),
              const WordCardWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class _AppbarView extends StatelessWidget {
  const _AppbarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: const FaIcon(
            FontAwesomeIcons.barsProgress,
            size: 18,
          ),
          onTap: () {},
        ),
        const Spacer(),
        CustomIconButton(
          icon: const Icon(Icons.bookmark),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TestScree(),
              ),
            );
          },
        ),
      ],
    );
  }
}
