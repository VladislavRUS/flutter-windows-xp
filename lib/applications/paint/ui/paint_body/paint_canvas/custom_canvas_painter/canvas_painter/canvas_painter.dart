import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';

class CanvasPainter extends CustomPainter {
  final List<DrawingModel> drawings;

  CanvasPainter({
    required this.drawings,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final drawing in drawings) {
      switch (drawing.type) {
        case DrawingType.background:
          {
            _paintBackground(canvas, size, drawing.paint);
            break;
          }
        case DrawingType.path:
          {
            _paintPath(canvas, drawing.path!, drawing.paint);
            break;
          }

        case DrawingType.fill:
          {
            _paintFill(canvas, size, drawing.paint);
            break;
          }
      }
    }
  }

  void _paintPath(Canvas canvas, Path path, Paint paint) {
    canvas.drawPath(path, paint);
  }

  void _paintBackground(Canvas canvas, Size size, Paint paint) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  void _paintFill(Canvas canvas, Size size, Paint paint) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}