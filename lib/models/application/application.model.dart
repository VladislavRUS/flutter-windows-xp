import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/models/window_properties/window_properties.model.dart';

class ApplicationModel {
  final String id;
  final String name;
  final Widget widget;
  final String icon;
  final WindowPropertiesModel? windowProperties;

  ApplicationModel({
    required this.id,
    required this.name,
    required this.widget,
    required this.icon,
    this.windowProperties,
  });
}
