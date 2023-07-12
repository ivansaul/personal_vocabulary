import 'package:flutter/material.dart';
import 'package:flutter_template/config/theme/app_theme.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColorLightGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
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
              ),
              const SizedBox(height: 50),
              Text(
                'Practice English',
                style: AppTheme.titleLargeTextStyle,
              ),
              const SizedBox(height: 10),
              const ProgressWidget(progress: 0.25),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColorWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'pleasure',
                                style: AppTheme.titleLargeTextStyle,
                              ),
                              Text(
                                "[ˈpleʒər]",
                                style: GoogleFonts.lexend(
                                  color: AppTheme.primaryColorGray,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CustomIconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: AppTheme.primaryColorWhite,
                            ),
                            color: AppTheme.primaryColorBlack,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'placer, gusto, voluntad',
                        style: GoogleFonts.lexend(
                          color: AppTheme.primaryColorBlack,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Examples',
                        style: GoogleFonts.lexend(
                          color: AppTheme.primaryColorBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Eating disorders are an example of the loss of the ability to be satisfied with the simplest pleasure of life.",
                        style: GoogleFonts.lexend(
                          color: AppTheme.primaryColorBlack.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Eating disorders are an example of the loss of the ability to be satisfied with the simplest pleasure of life.",
                        style: GoogleFonts.lexend(
                          color: AppTheme.primaryColorBlack.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          CustomTextIconButton(
                            text: 'Listen',
                            onTap: () {},
                          ),
                          const Spacer(),
                          CustomTextIconButton(
                            color: Colors.red,
                            colorText: Colors.yellow,
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            text: 'View more',
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
