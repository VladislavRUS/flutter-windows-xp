import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'package:flutter_windows_xp/applications/winamp/domain/use_cases/use_cases.dart';
import 'package:flutter_windows_xp/applications/winamp/domain/watchers/watchers.dart';
import 'winamp_playlist_state.dart';

@injectable
class WinampPlaylistBloc extends Cubit<WinampPlaylistState> {
  final GetTracksUseCase _getTracksUseCase;
  final PlayTrackUseCase _playTrackUseCase;
  final PlayingTrackWatcher _playingTrackWatcher;

  StreamSubscription<TrackModel?>? _playingTrackSubscription;

  WinampPlaylistBloc(
    this._getTracksUseCase,
    this._playTrackUseCase,
    this._playingTrackWatcher,
  ) : super(const WinampPlaylistState(tracks: [])) {
    _playingTrackSubscription =
        _playingTrackWatcher.watch(PlayingTrackWatcherParams()).listen((track) {
      emit(state.copyWith(playing: track));
    });
  }

  @override
  Future<void> close() {
    _playingTrackSubscription?.cancel();

    return super.close();
  }

  void getTracks() async {
    final tracks = await _getTracksUseCase.execute(GetTracksUseCaseParams());

    emit(WinampPlaylistState(tracks: tracks));
  }

  void selectTrack(TrackModel track) {
    emit(state.copyWith(selected: track));
  }

  void playTrack(TrackModel track) async {
    emit(state.copyWith(selected: track));

    await _playTrackUseCase.execute(PlayTrackUseCaseParams(track: track));
  }
}
