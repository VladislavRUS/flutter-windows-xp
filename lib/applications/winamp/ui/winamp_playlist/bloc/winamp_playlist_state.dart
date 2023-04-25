import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';

part 'winamp_playlist_state.freezed.dart';

@freezed
class WinampPlaylistState with _$WinampPlaylistState {
  const factory WinampPlaylistState({
    required List<TrackModel> tracks,
    TrackModel? selected,
    TrackModel? playing,
  }) = _WinampPlaylistState;
}
