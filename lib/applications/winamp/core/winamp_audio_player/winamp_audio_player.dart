import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';

@singleton
class WinampAudioPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> play(String url) async {
    await _audioPlayer.play(AssetSource(url.replaceAll('assets/', '')));
  }
}
