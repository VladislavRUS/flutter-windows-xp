import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/paint/data/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class FillTool extends CanvasTool {
  FillTool(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.fill,
          iconPath: Assets.applications.paint.toolFill.path,
        );

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    drawings.add(
      FillDrawingModel(
        paint: Paint()..color = paintStore.colorsStore.primaryColor,
      ),
    );
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {}

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {}

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}
