import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/ui/providers/localdb_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/helpers/helpers.dart';
import '../../config/theme/app_theme.dart';
import '../widgets/widgets.dart';

class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  LearnScreenState createState() => LearnScreenState();
}

class LearnScreenState extends ConsumerState<LearnScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(randomWordsProvider.notifier).getRandomWords(count: 10);
  }

  CardSwiperController controller = CardSwiperController();
  @override
  Widget build(BuildContext context) {
    final words = ref.watch(randomWordsProvider);

    bool swipingRight = false;
    bool swipingLeft = false;
    return Scaffold(
      backgroundColor: AppTheme.primaryColorLightGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
          child: Column(
            children: [
              const CustomAppbar(),
              const SizedBox(height: 50),
              const ProgressWidget(progress: 0.45),
              const SizedBox(height: 30),
              Expanded(
                child: CardSwiper(
                  controller: controller,
                  padding: EdgeInsets.zero,
                  cardsCount: words.length,
                  numberOfCardsDisplayed: 1,
                  allowedSwipeDirection: AllowedSwipeDirection.symmetric(horizontal: true),
                  onSwipeDirectionChange: (horizontalDirection, verticalDirection) {
                    if (horizontalDirection == CardSwiperDirection.right) {
                      swipingRight = true;
                      swipingLeft = false;
                    }
                    if (horizontalDirection == CardSwiperDirection.left) {
                      swipingLeft = true;
                      swipingRight = false;
                    }
                    if (horizontalDirection == CardSwiperDirection.none) {
                      swipingLeft = false;
                      swipingRight = false;
                    }
                  },
                  cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                    final word = words[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColorWhite,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: AppTheme.primaryColorBlack.withOpacity(0.5),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text(index.toString())),
                          
                          // TITLE + SOUND
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      word.name,
                                      style: AppTheme.titleLargeTextStyle,
                                    ),
                                    Text(
                                      "[${word.ipa.first}]",
                                      style: GoogleFonts.lexend(
                                        color: AppTheme.primaryColorGray,
                                        fontSize: 16,
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
                          ),
                          const Divider(),

                          // SENSE
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                            child: Text(
                              StringHelper.listToString(word.sense),
                              style: GoogleFonts.lexend(
                                color: AppTheme.primaryColorBlack.withOpacity(0.9),
                                fontSize: 14,
                              ),
                            ),
                          ),

                          // EXAMPLES
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                              child: ListView.builder(
                                itemCount: word.examples.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final example = word.examples[index];
                                  return ExampleExpansionWidget(
                                    title: example.en!,
                                    subtitle: example.es!,
                                  );
                                },
                              ),
                            ),
                          ),

                          // LEFT - RIGHT BUTTONS
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        controller.swipeLeft();
                                      },
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          color: swipingLeft ? Colors.green : Colors.white,
                                        ),
                                        padding:
                                            const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Ya conozco está palabra',
                                                style: GoogleFonts.lexend(
                                                  fontSize: 12,
                                                  color: swipingLeft
                                                      ? Colors.white
                                                      : AppTheme.primaryColorBlack,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_left_rounded,
                                              color: swipingLeft
                                                  ? Colors.white
                                                  : AppTheme.primaryColorBlack,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                  ),
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        controller.swipeRight();
                                      },
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          color: swipingRight ? Colors.blue : Colors.white,
                                        ),
                                        padding:
                                            const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.keyboard_arrow_right_rounded,
                                              color: swipingRight
                                                  ? Colors.white
                                                  : AppTheme.primaryColorBlack,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Empezar a aprender está palabra',
                                                style: GoogleFonts.lexend(
                                                  fontSize: 12,
                                                  color: swipingRight
                                                      ? Colors.white
                                                      : AppTheme.primaryColorBlack,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
