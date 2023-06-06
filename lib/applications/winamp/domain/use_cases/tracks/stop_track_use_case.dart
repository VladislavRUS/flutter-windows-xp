import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/core/winamp_audio_player/winamp_audio_player.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';

@injectable
class StopTrackUseCase
    extends BaseUseCase<Future<void>, StopTrackUseCaseParams> {
  final WinampAudioPlayer _audioPlayer;

  StopTrackUseCase(
    this._audioPlayer,
  );

  @override
  Future<void> execute(
    StopTrackUseCaseParams params,
  ) async {
    await _audioPlayer.stop();
  }
}

class StopTrackUseCaseParams {}
