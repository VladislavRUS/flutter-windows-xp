import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/core/winamp_audio_player/winamp_audio_player.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

@injectable
class PlayLamaTrackUseCase
    extends BaseUseCase<Future<void>, PlayLamaTrackUseCaseParams> {
  final WinampAudioPlayer _audioPlayer;

  PlayLamaTrackUseCase(
    this._audioPlayer,
  );

  @override
  Future<void> execute(
    PlayLamaTrackUseCaseParams params,
  ) async {
    await _audioPlayer.play(Assets.applications.winamp.tracks.lama);
  }
}

class PlayLamaTrackUseCaseParams {}
