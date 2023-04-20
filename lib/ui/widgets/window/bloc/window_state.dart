import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/data/models/models.dart';

part 'window_state.freezed.dart';

@freezed
class WindowState with _$WindowState {
  const factory WindowState({
    WindowModel? window,
  }) = _WindowsRendererState;
}
