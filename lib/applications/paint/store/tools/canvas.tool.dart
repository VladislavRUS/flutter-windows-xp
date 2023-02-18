import 'package:flutter/cupertino.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/colors.store.dart';

abstract class CanvasTool {
  final ColorsStore colorsStore;
  final CanvasToolType type;
  final String iconPath;

  CanvasTool(
    this.colorsStore, {
    required this.type,
    required this.iconPath,
  });

  void onStart(List<DrawingModel> drawings, DragStartDetails details);
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details);
  void onEnd(List<DrawingModel> drawings, DragEndDetails details);
}

enum CanvasToolType {
  select,
  squareSelect,
  eraser,
  fill,
  picker,
  zoom,
  pencil,
  brush,
  spray,
  text,
  line,
  curve,
  rect,
  poly,
  ellipsis,
  rounded,
}
