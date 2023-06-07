import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';

@singleton
class WinampAudioPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> play(String url) async {
    await _audioPlayer.play(AssetSource(url.replaceAll('assets/', '')));
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<PlayerState> getPlayerState() async {
    return _audioPlayer.state;
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
  }
}
