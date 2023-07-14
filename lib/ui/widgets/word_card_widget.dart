import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/entities/word.dart';
import 'package:flutter_template/ui/providers/localdb_provider.dart';
import 'package:flutter_template/ui/screens/detail_screen.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/app_theme.dart';

class WordCardWidget extends ConsumerWidget {
  final Word word;

  const WordCardWidget({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPlaying = false;

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
          InkWell(
            child: Text(
              'New Word',
              style: GoogleFonts.lexend(
                color: AppTheme.primaryColorWhite,
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            onTap: () {
              ref.read(randomWordsProvider.notifier).getRandomWords(count: 1);
            },
          ),
          Row(
            children: [
              Text(
                word.name,
                style: GoogleFonts.lexend(
                  color: AppTheme.primaryColorWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "[${word.ipa.first}]",
                style: GoogleFonts.lexend(
                  color: AppTheme.primaryColorGray,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Text(
            word.sense.join(', '),
            style: GoogleFonts.lexend(
              color: AppTheme.primaryColorGray,
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              CustomTextIconButton(
                text: 'Listen',
                icon: const Icon(Icons.volume_up_rounded),
                colorText: AppTheme.primaryColorBlack,
                color: AppTheme.primaryColorWhite,
                onTap: () async {
                  if (!isPlaying) {
                    // Verificar si la reproducción ya se ha realizado
                    try {
                      isPlaying = true;
                      final player = AudioPlayer();
                      await player.play(UrlSource(word.soundUS));
                      // await player.dispose();
                    } catch (e) {
                      print(e);
                    } finally {
                      isPlaying = false;
                    }
                  }
                },
              ),
              const Spacer(),
              CustomTextIconButton(
                text: 'Wiew more',
                colorText: AppTheme.primaryColorBlack,
                color: AppTheme.primaryColorWhite,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(word: word),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
