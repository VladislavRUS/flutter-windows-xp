import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'canvas_cursor/canvas_cursor.dart';
import 'custom_canvas_painter/custom_canvas_painter.dart';

class PaintCanvas extends StatelessWidget {
  const PaintCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canvasStore = context.read<PaintStore>().canvasStore;

    return ClipRRect(
      child: FittedBox(
        child: RepaintBoundary(
          key: canvasStore.canvasKey,
          child: const SizedBox(
            width: 800,
            height: 600,
            child: CanvasCursor(
              child: CustomCanvasPainter(),
            ),
          ),
        ),
      ),
    );
  }
}
