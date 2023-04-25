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
    final tracks = await _tracksRepository.getTracks();

    final updatedTracks = tracks.map((e) {
      if (e.id == params.track.id) {
        return params.track.copyWith(playing: true);
      }

      return e.copyWith(playing: false);
    }).toList();

    await _tracksRepository.updateTracks(updatedTracks);
    await _audioPlayer.play(params.track.path);
  }
}

class PlayTrackUseCaseParams {
  final TrackModel track;

  PlayTrackUseCaseParams({
    required this.track,
  });
}
