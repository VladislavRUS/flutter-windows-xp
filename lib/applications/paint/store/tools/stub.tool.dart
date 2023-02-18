import 'package:flutter/gestures.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';

class StubTool extends CanvasTool {
  StubTool(
    PaintStoreBase paintStore, {
    required CanvasToolType type,
    required String iconPath,
  }) : super(paintStore, type: type, iconPath: iconPath);

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {}

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {}

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {}
}