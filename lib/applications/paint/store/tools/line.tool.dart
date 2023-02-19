import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';
import 'package:mobx/mobx.dart';

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
  double size = 2;

  final availableSizes = <double>[2, 3, 4, 5, 6];

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

    if (path.length > 1) {
      path.removeLast();
    }

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
