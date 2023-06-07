import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_actions_state.freezed.dart';

@freezed
class AudioActionsState with _$AudioActionsState {
  const factory AudioActionsState({
    @Default(false) bool shuffle,
    @Default(false) bool repeat,
  }) = _AudioActionsState;
}
