import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

part 'line.tool.g.dart';

class LineTool = LineToolBase with _$LineTool;

abstract class LineToolBase extends CanvasTool with Store {
  LineToolBase(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.line,
          iconPath: Assets.apps.paint.toolLine.path,
        );

  @observable
  double size = 1;

  final availableSizes = <double>[1, 2, 3, 4, 5];

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    final paint = Paint()
      ..color = paintStore.colorsStore.primaryColor
      ..strokeWidth = size
      ..strokeCap = StrokeCap.round;

    drawings.add(
      PointsDrawingModel(
        points: [
          Offset(
            details.localPosition.dx,
            details.localPosition.dy,
          ),
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

    currentDrawing.points.removeLast();

    currentDrawing.points.add(
      Offset(
        details.localPosition.dx,
        details.localPosition.dy,
      ),
    );
  }

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {}

  @action
  void onSelectSize(double value) {
    size = value;
  }

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}
