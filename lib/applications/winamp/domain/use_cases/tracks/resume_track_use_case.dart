import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/core/winamp_audio_player/winamp_audio_player.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';

@injectable
class ResumeTrackUseCase
    extends BaseUseCase<Future<void>, ResumeTrackUseCaseParams> {
  final WinampAudioPlayer _audioPlayer;

  ResumeTrackUseCase(
    this._audioPlayer,
  );

  @override
  Future<void> execute(
    ResumeTrackUseCaseParams params,
  ) async {
    await _audioPlayer.resume();
  }
}

class ResumeTrackUseCaseParams {}
