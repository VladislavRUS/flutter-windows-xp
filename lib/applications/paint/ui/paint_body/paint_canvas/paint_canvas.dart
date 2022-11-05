import 'package:flutter/material.dart';

import 'canvas_cursor/canvas_cursor.dart';
import 'canvas_painter/canvas_painter.dart';

class PaintCanvas extends StatelessWidget {
  const PaintCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: CanvasCursor(
        child: CustomPaint(
          painter: CanvasPainter(),
        ),
      ),
    );
  }
}
