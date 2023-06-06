import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'package:flutter_windows_xp/core/utils/get_short_id.dart';
import 'tracks_state.dart';

@singleton
class TracksBloc extends Cubit<TracksState> {
  TracksBloc()
      : super(
          TracksState(
            tracks: [
              TrackModel(
                id: getShortId(),
                name: 'My Universe',
                author: 'Nesterouk',
                durationInSeconds: 147,
                path: Assets.applications.winamp.tracks.myUniverse,
              ),
              TrackModel(
                id: getShortId(),
                name: 'Eco Technology',
                author: 'Lexin Music',
                durationInSeconds: 122,
                path: Assets.applications.winamp.tracks.ecoTechnology,
              ),
              TrackModel(
                id: getShortId(),
                name: 'Relaxing',
                author: 'Music for Videos',
                durationInSeconds: 72,
                path: Assets.applications.winamp.tracks.relaxing,
              ),
              TrackModel(
                id: getShortId(),
                name: 'Floating Abstract',
                author: 'ComaStudio',
                durationInSeconds: 97,
                path: Assets.applications.winamp.tracks.floatingAbstract,
              ),
              TrackModel(
                id: getShortId(),
                name: 'Risk',
                author: 'StudioKolomna',
                durationInSeconds: 72,
                path: Assets.applications.winamp.tracks.risk,
              ),
              TrackModel(
                id: getShortId(),
                name: 'Abstract Fashion Pop',
                author: 'QubeSounds',
                durationInSeconds: 92,
                path: Assets.applications.winamp.tracks.abstractFashionPop,
              ),
            ],
          ),
        );

  void setPlayingTrack(TrackModel? track) {
    emit(
      state.copyWith(
        playingTrack: track,
      ),
    );
  }

  void updateTrack(TrackModel track) {
    emit(
      state.copyWith(
        tracks: state.tracks.map((e) {
          if (e.id == track.id) {
            return track;
          }

          return e;
        }).toList(),
      ),
    );
  }

  void updateTracks(List<TrackModel> tracks) {
    emit(
      state.copyWith(
        tracks: tracks,
      ),
    );
  }
}
