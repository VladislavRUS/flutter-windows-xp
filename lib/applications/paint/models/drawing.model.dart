import 'package:flutter/painting.dart';

class DrawingModel {
  final Path? path;
  final Paint paint;
  final DrawingType type;

  DrawingModel({
    this.path,
    required this.paint,
    required this.type,
  });
}

enum DrawingType {
  path,
  background,
  fill,
}
