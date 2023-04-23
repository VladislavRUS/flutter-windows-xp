import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/data/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

part 'poly.tool.g.dart';

class PolyTool = PolyToolBase with _$PolyTool;

abstract class PolyToolBase extends CanvasTool with Store {
  PolyToolBase(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.poly,
          iconPath: Assets.applications.paint.toolPoly.path,
        );

  @observable
  double size = 1;

  final availableSizes = <double>[1, 2, 3, 4, 5];

  bool _wasTouched = false;

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    final paint = Paint()
      ..color = paintStore.colorsStore.primaryColor
      ..strokeWidth = size
      ..strokeCap = StrokeCap.round;

    if (_wasTouched) {
      final currentDrawing = drawings.last as PointsDrawingModel;

      currentDrawing.setPaint(paint);

      currentDrawing.points.add(
        Offset(
          details.localPosition.dx,
          details.localPosition.dy,
        ),
      );

      return;
    }

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

    _wasTouched = true;
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
  void onDeselected() {
    _wasTouched = false;
  }
}
