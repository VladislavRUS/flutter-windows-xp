import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/paint/data/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/paint.store.dart';

abstract class CanvasTool {
  final PaintStoreBase paintStore;
  final CanvasToolType type;
  final String iconPath;

  CanvasTool(
    this.paintStore, {
    required this.type,
    required this.iconPath,
  });

  void onStart(List<DrawingModel> drawings, DragStartDetails details);
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details);
  void onEnd(List<DrawingModel> drawings, DragEndDetails details);

  void onSelected();
  void onDeselected();
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
