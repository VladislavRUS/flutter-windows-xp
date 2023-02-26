import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';

class CanvasPainter extends CustomPainter {
  final List<DrawingModel> drawings;
  final bool Function(List<DrawingModel>, List<DrawingModel>) repaintWhen;

  CanvasPainter({
    required this.drawings,
    required this.repaintWhen,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final drawing in drawings) {
      if (drawing is PathDrawingModel) {
        _paintPath(canvas, drawing.path, drawing.paint);
      } else if (drawing is PointsDrawingModel) {
        _paintPoints(canvas, drawing.pointMode, drawing.points, drawing.paint);
      } else if (drawing is FillDrawingModel) {
        _paintFill(canvas, size, drawing.paint);
      }
    }
  }

  void _paintPath(Canvas canvas, Path path, Paint paint) {
    canvas.drawPath(path, paint);
  }

  void _paintPoints(
    Canvas canvas,
    PointMode pointMode,
    List<Offset> points,
    Paint paint,
  ) {
    canvas.drawPoints(pointMode, points, paint);
  }

  void _paintFill(Canvas canvas, Size size, Paint paint) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) {
    return repaintWhen(oldDelegate.drawings, drawings);
  }
}
