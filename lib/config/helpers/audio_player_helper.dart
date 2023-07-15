import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  void audioPlayerUrl(String url) async {
    final player = AudioPlayer();
    await player.play(UrlSource(url));
  }
}
