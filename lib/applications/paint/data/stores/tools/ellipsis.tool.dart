import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/data/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

part 'ellipsis.tool.g.dart';

class EllipsisTool = EllipsisToolBase with _$EllipsisTool;

abstract class EllipsisToolBase extends CanvasTool with Store {
  final double _borderWidth = 1;

  Offset? _startPosition;

  int? prevGeneratedLength;

  @observable
  EllipsisToolStyle style = EllipsisToolStyle.border;

  EllipsisToolBase(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.ellipsis,
          iconPath: Assets.applications.paint.toolEllipsis.path,
        );

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    _startPosition = details.localPosition;

    final ellipsisDrawings = _getEllipsisDrawings(
      _startPosition!,
      details.localPosition,
      style,
    );

    drawings.addAll(ellipsisDrawings);
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {
    final ellipsisDrawings = _getEllipsisDrawings(
      _startPosition!,
      details.localPosition,
      style,
    );

    for (var i = 0; i < ellipsisDrawings.length; i++) {
      final drawing = drawings[drawings.length - ellipsisDrawings.length + i]
          as PathDrawingModel;

      drawing.path.reset();
      drawing.path.addPath(ellipsisDrawings[i].path, Offset.zero);
    }
  }

  List<PathDrawingModel> _getEllipsisDrawings(
    Offset start,
    Offset end,
    EllipsisToolStyle style,
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

    final path = Path()..addOval(rect);

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

    if (style == EllipsisToolStyle.borderFill ||
        style == EllipsisToolStyle.fill) {
      final innerEllipsis = rect.inflate(-_borderWidth / 2);

      final path = Path()..addOval(innerEllipsis);

      final paint = Paint()
        ..color = style == EllipsisToolStyle.borderFill
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
  void onSelectType(EllipsisToolStyle value) {
    style = value;
  }

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}

enum EllipsisToolStyle {
  border,
  borderFill,
  fill,
}
