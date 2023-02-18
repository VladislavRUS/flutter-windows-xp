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

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    drawings.add(
      DrawingModel(
        path: [
          Offset(
            details.localPosition.dx,
            details.localPosition.dy,
          )
        ],
        paint: Paint()
          ..color = paintStore.colorsStore.secondaryColor
          ..strokeWidth = size
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

  @action
  void onSelectSize(double value) {
    size = value;
  }
}
