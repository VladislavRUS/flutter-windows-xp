import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:tuple/tuple.dart';
import 'package:universal_io/io.dart';

@singleton
class WinampAudioPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache();

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

  Future<Tuple2<Uri, Duration>> cacheAudio(File audio) async {
    final uri = await _audioCache.fetchToMemory(audio.path);

    final player = AudioPlayer();
    player.setSourceUrl(uri.path);
    final duration = await player.getDuration();

    player.dispose();

    return Tuple2(uri, duration!);
  }
}
