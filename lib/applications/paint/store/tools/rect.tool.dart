import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

part 'rect.tool.g.dart';

class RectTool = RectToolBase with _$RectTool;

abstract class RectToolBase extends CanvasTool with Store {
  final double _borderWidth = 1;

  Offset? _startPosition;
  int? prevGeneratedLength;

  @observable
  RectToolStyle style = RectToolStyle.border;

  RectToolBase(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.rect,
          iconPath: Assets.apps.paint.toolRect.path,
        );

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    _startPosition = details.localPosition;

    final rectDrawings = _getRectDrawings(
      _startPosition!,
      details.localPosition,
      style,
    );

    drawings.addAll(rectDrawings);
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {
    final rectDrawings = _getRectDrawings(
      _startPosition!,
      details.localPosition,
      style,
    );

    for (var i = 0; i < rectDrawings.length; i++) {
      final drawing = drawings[drawings.length - rectDrawings.length + i]
          as PathDrawingModel;

      drawing.path.reset();
      drawing.path.addPath(rectDrawings[i].path, Offset.zero);
    }
  }

  List<PathDrawingModel> _getRectDrawings(
    Offset start,
    Offset end,
    RectToolStyle style,
  ) {
    final drawings = <PathDrawingModel>[];

    final rect = Rect.fromPoints(
      Offset(
        start.dx,
        start.dy,
      ),
      Offset(
        end.dx,
        end.dy,
      ),
    );

    final path = Path()..addRect(rect);

    final paint = Paint()
      ..color = paintStore.colorsStore.primaryColor
      ..strokeWidth = _borderWidth
      ..strokeCap = StrokeCap.round;

    paint.style = PaintingStyle.stroke;

    drawings.add(
      PathDrawingModel(
        path: path,
        paint: paint,
      ),
    );

    if (style == RectToolStyle.borderFill || style == RectToolStyle.fill) {
      final innerRect = rect.inflate(-_borderWidth / 2);

      final path = Path()..addRect(innerRect);

      final paint = Paint()
        ..color = style == RectToolStyle.borderFill
            ? paintStore.colorsStore.secondaryColor
            : paintStore.colorsStore.primaryColor
        ..strokeWidth = _borderWidth
        ..strokeCap = StrokeCap.round;

      paint.style = PaintingStyle.fill;

      drawings.add(
        PathDrawingModel(
          path: path,
          paint: paint,
        ),
      );
    }

    return drawings;
  }

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {
    _startPosition = null;
    prevGeneratedLength = null;
  }

  @action
  void onSelectType(RectToolStyle value) {
    style = value;
  }

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}

enum RectToolStyle {
  border,
  borderFill,
  fill,
}
