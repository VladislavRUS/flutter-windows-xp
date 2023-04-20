import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/data/models/models.dart';

part 'desktop_renderer_state.freezed.dart';

@freezed
class DesktopRendererState with _$DesktopRendererState {
  const factory DesktopRendererState({
    required List<ApplicationModel> applications,
  }) = _DesktopRendererState;
}
