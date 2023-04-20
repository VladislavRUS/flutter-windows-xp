import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/data/models/models.dart';

part 'windows_renderer_state.freezed.dart';

@freezed
class WindowsRendererState with _$WindowsRendererState {
  const WindowsRendererState._();

  const factory WindowsRendererState({
    required List<WindowModel> windows,
  }) = _WindowsRendererState;

  List<WindowModel> get displayWindows {
    final visibleWindows = windows.where((window) => !window.hidden).toList();

    final sortedWindows = List<WindowModel>.from(visibleWindows)
      ..sort((a, b) => a.zIndex.compareTo(b.zIndex));

    return sortedWindows;
  }
}
