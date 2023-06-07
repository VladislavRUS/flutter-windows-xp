import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'package:flutter_windows_xp/applications/winamp/domain/use_cases/tracks/load_tracks_use_case.dart';
import 'package:flutter_windows_xp/applications/winamp/domain/use_cases/use_cases.dart';
import 'package:flutter_windows_xp/applications/winamp/domain/watchers/watchers.dart';
import 'audio_actions_state.dart';

@injectable
class AudioActionsBloc extends Cubit<AudioActionsState> {
  final ResumeTrackUseCase _resumeTrackUseCase;
  final StopTrackUseCase _stopTrackUseCase;
  final PauseTrackUseCase _pauseTrackUseCase;
  final PlayPreviousTrackUseCase _playPreviousTrackUseCase;
  final PlayNextTrackUseCase _playNextTrackUseCase;
  final LoadTracksUseCase _loadTracksUseCase;
  final SettingsWatcher _settingsWatcher;
  final SetShuffleUseCase _setShuffleUseCase;
  final SetRepeatUseCase _setRepeatUseCase;

  StreamSubscription<SettingsModel>? _settingsWatcherSubscription;

  AudioActionsBloc(
    this._resumeTrackUseCase,
    this._stopTrackUseCase,
    this._pauseTrackUseCase,
    this._playPreviousTrackUseCase,
    this._playNextTrackUseCase,
    this._loadTracksUseCase,
    this._settingsWatcher,
    this._setShuffleUseCase,
    this._setRepeatUseCase,
  ) : super(const AudioActionsState()) {
    _settingsWatcherSubscription =
        _settingsWatcher.watch(SettingsWatcherParams()).listen((event) {
      emit(
        state.copyWith(
          shuffle: event.shuffle,
          repeat: event.repeat,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _settingsWatcherSubscription?.cancel();

    return super.close();
  }

  void resumeTrack() {
    _resumeTrackUseCase.execute(ResumeTrackUseCaseParams());
  }

  void stopTrack() {
    _stopTrackUseCase.execute(StopTrackUseCaseParams());
  }

  void pauseTrack() {
    _pauseTrackUseCase.execute(PauseTrackUseCaseParams());
  }

  void previousTrack() {
    _playPreviousTrackUseCase.execute(PlayPreviousTrackUseCaseParams());
  }

  void nextTrack() {
    _playNextTrackUseCase.execute(PlayNextTrackUseCaseParams());
  }

  void loadTracks() {
    _loadTracksUseCase.execute(LoadTracksUseCaseParams());
  }

  void toggleShuffle() {
    _setShuffleUseCase.execute(
      SetShuffleUseCaseParams(
        shuffle: !state.shuffle,
      ),
    );
  }

  void toggleRepeat() {
    _setRepeatUseCase.execute(
      SetRepeatUseCaseParams(
        repeat: !state.repeat,
      ),
    );
  }
}
