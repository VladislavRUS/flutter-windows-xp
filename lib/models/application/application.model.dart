import 'package:flutter/material.dart';

class ApplicationModel {
  final String id;
  final String name;
  final Widget widget;
  final String icon;

  ApplicationModel({
    required this.id,
    required this.name,
    required this.widget,
    required this.icon,
  });
}
