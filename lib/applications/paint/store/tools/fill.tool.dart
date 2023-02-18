import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/colors.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

class FillTool extends CanvasTool {
  FillTool(ColorsStore colorsStore)
      : super(
          colorsStore,
          type: CanvasToolType.fill,
          iconPath: Assets.apps.paint.toolFill.path,
        );

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    drawings.add(
      DrawingModel(
        paint: Paint()..color = colorsStore.primaryColor,
        type: DrawingType.fill,
      ),
    );
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {}

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {}
}
