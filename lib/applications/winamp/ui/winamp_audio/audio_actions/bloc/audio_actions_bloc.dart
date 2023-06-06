import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/domain/use_cases/use_cases.dart';
import 'audio_actions_state.dart';

@injectable
class AudioActionsBloc extends Cubit<AudioActionsState> {
  final ResumeTrackUseCase _resumeTrackUseCase;
  final StopTrackUseCase _stopTrackUseCase;
  final PauseTrackUseCase _pauseTrackUseCase;
  final PlayPreviousTrackUseCase _playPreviousTrackUseCase;
  final PlayNextTrackUseCase _playNextTrackUseCase;

  AudioActionsBloc(
    this._resumeTrackUseCase,
    this._stopTrackUseCase,
    this._pauseTrackUseCase,
    this._playPreviousTrackUseCase,
    this._playNextTrackUseCase,
  ) : super(const AudioActionsState());

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
}
