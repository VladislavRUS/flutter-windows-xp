import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

class PencilTool extends CanvasTool {
  PencilTool(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.pencil,
          iconPath: Assets.apps.paint.toolPencil.path,
        );

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    drawings.add(
      DrawingModel(
        path: [
          Offset(
            details.localPosition.dx,
            details.localPosition.dy,
          ),
        ],
        paint: Paint()
          ..color = paintStore.colorsStore.primaryColor
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round,
        type: DrawingType.path,
      ),
    );
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {
    final currentDrawing = drawings.last;

    final path = currentDrawing.path!;

    path.add(
      Offset(
        details.localPosition.dx,
        details.localPosition.dy,
      ),
    );
  }

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {}
}
