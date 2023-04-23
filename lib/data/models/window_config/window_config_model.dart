import 'package:freezed_annotation/freezed_annotation.dart';

part 'window_config_model.freezed.dart';

@freezed
class WindowConfigModel with _$WindowConfigModel {
  const WindowConfigModel._();

  const factory WindowConfigModel({
    @Default(true) bool resizable,
  }) = _WindowConfigModel;
}
