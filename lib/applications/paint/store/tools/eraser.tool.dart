import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

part 'eraser.tool.g.dart';

class EraserTool = EraserToolBase with _$EraserTool;

abstract class EraserToolBase extends CanvasTool with Store {
  EraserToolBase(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.eraser,
          iconPath: Assets.apps.paint.toolEraser.path,
        );

  @observable
  double size = 4;

  final availableSizes = <double>[4, 6, 8, 10];

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    final paint = Paint()
      ..color = paintStore.colorsStore.secondaryColor
      ..strokeWidth = size
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

  @action
  void onSelectSize(double value) {
    size = value;
  }

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}
