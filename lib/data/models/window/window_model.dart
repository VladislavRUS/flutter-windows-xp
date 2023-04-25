import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/data/models/models.dart';

part 'window_model.freezed.dart';

@freezed
class WindowModel with _$WindowModel {
  const WindowModel._();

  const factory WindowModel({
    required String id,
    required ApplicationModel application,
    @Default('') String name,
    @Default(0) int zIndex,
    @Default(200) double x,
    @Default(200) double y,
    @Default(800) double width,
    @Default(600) double height,
    @Default(false) bool maximized,
    @Default(false) bool hidden,
    @Default(false) bool focused,
  }) = _WindowModel;

  bool get resizeDisabled =>
      maximized || (application.windowConfig?.resizable ?? true);
}
