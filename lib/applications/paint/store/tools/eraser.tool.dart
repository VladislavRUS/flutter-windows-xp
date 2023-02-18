import 'package:flutter/widgets.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/colors.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

class EraserTool extends CanvasTool {
  EraserTool(ColorsStore colorsStore)
      : super(
          colorsStore,
          type: CanvasToolType.eraser,
          iconPath: Assets.apps.paint.toolEraser.path,
        );

  @observable
  double size = 5;

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    drawings.add(
      DrawingModel(
        path: Path()
          ..moveTo(
            details.localPosition.dx,
            details.localPosition.dy,
          ),
        paint: Paint()
          ..color = colorsStore.secondaryColor
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

    path.lineTo(details.localPosition.dx, details.localPosition.dy);
  }

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {}

  void onSelectSize(double value) {
    size = value;
  }
}
