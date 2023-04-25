import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';

part 'tracks_state.freezed.dart';

@freezed
class TracksState with _$TracksState {
  const factory TracksState({
    required List<TrackModel> tracks,
  }) = _TracksState;
}
