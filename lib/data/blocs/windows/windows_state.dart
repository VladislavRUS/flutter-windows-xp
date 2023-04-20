import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/data/models/window/window_model.dart';

part 'windows_state.freezed.dart';

@freezed
class WindowsState with _$WindowsState {
  const factory WindowsState({
    required List<WindowModel> windows,
  }) = _WindowsState;
}
