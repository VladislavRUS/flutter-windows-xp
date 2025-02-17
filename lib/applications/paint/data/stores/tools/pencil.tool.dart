import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/paint/data/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class PencilTool extends CanvasTool {
  PencilTool(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.pencil,
          iconPath: Assets.applications.paint.toolPencil.path,
        );

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    final paint = Paint()
      ..color = paintStore.colorsStore.primaryColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    drawings.add(
      PointsDrawingModel(
        points: [
          Offset(
            details.localPosition.dx,
            details.localPosition.dy,
          ),
        ],
        paint: paint,
      ),
    );
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {
    final currentDrawing = drawings.last as PointsDrawingModel;

    currentDrawing.points.add(
      Offset(
        details.localPosition.dx,
        details.localPosition.dy,
      ),
    );
  }

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {}

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}
