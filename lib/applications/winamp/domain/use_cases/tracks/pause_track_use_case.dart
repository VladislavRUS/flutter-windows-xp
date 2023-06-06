import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/core/winamp_audio_player/winamp_audio_player.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';

@injectable
class PauseTrackUseCase
    extends BaseUseCase<Future<void>, PauseTrackUseCaseParams> {
  final WinampAudioPlayer _audioPlayer;

  PauseTrackUseCase(
    this._audioPlayer,
  );

  @override
  Future<void> execute(
    PauseTrackUseCaseParams params,
  ) async {
    await _audioPlayer.pause();
  }
}

class PauseTrackUseCaseParams {}
