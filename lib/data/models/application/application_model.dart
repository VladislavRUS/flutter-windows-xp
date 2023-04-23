import 'package:flutter/cupertino.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/data/models/models.dart';

part 'application_model.freezed.dart';

@freezed
class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    required String id,
    required String name,
    required String icon,
    required Widget Function(BuildContext) builder,
    WindowConfigModel? windowConfig,
  }) = _ApplicationModel;
}
