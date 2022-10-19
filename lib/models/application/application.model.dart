import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application.model.freezed.dart';

@freezed
class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    required String id,
    required String name,
    required Widget widget,
    required bool opened,
    required String icon,
  }) = _ApplicationModel;
}
