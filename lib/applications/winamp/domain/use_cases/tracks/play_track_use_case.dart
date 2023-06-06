import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/core/winamp_audio_player/winamp_audio_player.dart';
import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'package:flutter_windows_xp/applications/winamp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';

@injectable
class PlayTrackUseCase
    extends BaseUseCase<Future<void>, PlayTrackUseCaseParams> {
  final WinampAudioPlayer _audioPlayer;
  final TracksRepository _tracksRepository;

  PlayTrackUseCase(
    this._audioPlayer,
    this._tracksRepository,
  );

  @override
  Future<void> execute(
    PlayTrackUseCaseParams params,
  ) async {
    await _tracksRepository.setPlayingTrack(params.track);
    await _audioPlayer.play(params.track.path);
  }
}

class PlayTrackUseCaseParams {
  final TrackModel track;

  PlayTrackUseCaseParams({
    required this.track,
  });
}
