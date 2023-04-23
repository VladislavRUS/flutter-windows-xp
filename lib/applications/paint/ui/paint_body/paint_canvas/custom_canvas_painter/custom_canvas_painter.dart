import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/paint/data/stores/paint.store.dart';
import 'canvas_painter/canvas_painter.dart';

class CustomCanvasPainter extends StatefulWidget {
  const CustomCanvasPainter({Key? key}) : super(key: key);

  @override
  State<CustomCanvasPainter> createState() => _CustomCanvasPainterState();
}

class _CustomCanvasPainterState extends State<CustomCanvasPainter> {
  @override
  Widget build(BuildContext context) {
    final canvasStore = context.read<PaintStore>().canvasStore;

    return GestureDetector(
      onPanStart: canvasStore.onStart,
      onPanUpdate: canvasStore.onUpdate,
      onPanEnd: canvasStore.onEnd,
      child: Observer(
        builder: (_) => CustomPaint(
          willChange: true,
          isComplex: true,
          foregroundPainter: CanvasPainter(
            drawings: canvasStore.currentDrawing != null
                ? [canvasStore.currentDrawing!]
                : [],
            repaintWhen: (_, __) => true,
          ),
          painter: CanvasPainter(
            drawings: canvasStore.drawings,
            repaintWhen: (previous, current) =>
                previous.length != current.length,
          ),
        ),
      ),
    );
  }
}
