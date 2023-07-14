import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/ui/providers/localdb_provider.dart';

class TestScree extends ConsumerStatefulWidget {
  const TestScree({super.key});

  @override
  TestScreeState createState() => TestScreeState();
}

class TestScreeState extends ConsumerState<TestScree> {
  @override
  void initState() {
    super.initState();
    // ref.read(loadDataProvider.notifier).loadData();
    ref.read(randomWordsProvider.notifier).getRandomWords(count: 5);
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    bool isPlaying = false;

    final words = ref.watch(randomWordsProvider);
    if (words.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi AppBar'),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (BuildContext context, int index) {
          final word = words[index];
          return ListTile(
            title: Text(word.name),
            trailing: IconButton(
              onPressed: () async {
                if (!isPlaying) {
                  // Verificar si la reproducción ya se ha realizado
                  try {
                    isPlaying = true;
                    await player.play(UrlSource(word.soundUS));
                  } catch (e) {
                    print(e);
                  } finally {
                    isPlaying = false;
                  }
                }
              },
              icon: const Icon(Icons.play_circle_fill_rounded),
            ),
          );
        },
      ),
    );
  }
}
