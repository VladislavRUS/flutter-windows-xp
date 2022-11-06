import 'package:flutter/material.dart';

import 'canvas_cursor/canvas_cursor.dart';
import 'custom_canvas_painter/custom_canvas_painter.dart';

class PaintCanvas extends StatelessWidget {
  const PaintCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      child: FittedBox(
        child: SizedBox(
          width: 800,
          height: 600,
          child: CanvasCursor(
            child: CustomCanvasPainter(),
          ),
        ),
      ),
    );
  }
}
