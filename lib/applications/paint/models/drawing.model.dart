import 'package:flutter/painting.dart';

abstract class DrawingModel {
  final Paint paint;

  DrawingModel({
    required this.paint,
  });
}

class PathDrawingModel extends DrawingModel {
  final Path path;

  PathDrawingModel({
    required this.path,
    required Paint paint,
  }) : super(paint: paint);
}

class PointsDrawingModel extends DrawingModel {
  final List<Offset> points;

  PointsDrawingModel({
    required this.points,
    required Paint paint,
  }) : super(paint: paint);
}

class FillDrawingModel extends DrawingModel {
  FillDrawingModel({
    required Paint paint,
  }) : super(paint: paint);
}
