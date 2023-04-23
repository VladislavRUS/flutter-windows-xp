import 'dart:ui';

abstract class DrawingModel {
  Paint paint;

  void setPaint(Paint value) {
    paint = value;
  }

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
  final PointMode pointMode;

  PointsDrawingModel({
    required this.points,
    required Paint paint,
    this.pointMode = PointMode.polygon,
  }) : super(paint: paint);
}

class FillDrawingModel extends DrawingModel {
  FillDrawingModel({
    required Paint paint,
  }) : super(paint: paint);
}
