import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'play_track_use_case.dart';

@injectable
class PlayPreviousTrackUseCase
    extends BaseUseCase<Future<void>, PlayPreviousTrackUseCaseParams> {
  final TracksRepository _tracksRepository;
  final PlayTrackUseCase _playTrackUseCase;

  PlayPreviousTrackUseCase(
    this._tracksRepository,
    this._playTrackUseCase,
  );

  @override
  Future<void> execute(
    PlayPreviousTrackUseCaseParams params,
  ) async {
    final currentTrack = await _tracksRepository.getCurrentTrack();

    if (currentTrack == null) {
      return;
    }

    final tracks = await _tracksRepository.getTracks();

    final currentTrackIndex = tracks.indexOf(currentTrack);

    if (currentTrackIndex == 0) {
      return;
    }

    final previousTrack = tracks[currentTrackIndex - 1];

    await _playTrackUseCase.execute(
      PlayTrackUseCaseParams(track: previousTrack),
    );
  }
}

class PlayPreviousTrackUseCaseParams {}
