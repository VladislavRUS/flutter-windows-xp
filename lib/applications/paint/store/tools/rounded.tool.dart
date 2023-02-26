import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

part 'rounded.tool.g.dart';

class RoundedTool = RoundedToolBase with _$RoundedTool;

abstract class RoundedToolBase extends CanvasTool with Store {
  final double _borderWidth = 1;
  final double _borderRadius = 10;

  Offset? _startPosition;
  int? prevGeneratedLength;

  @observable
  RoundedToolStyle style = RoundedToolStyle.border;

  RoundedToolBase(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.rounded,
          iconPath: Assets.apps.paint.toolRounded.path,
        );

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    _startPosition = details.localPosition;

    final roundedDrawings = _getRoundedDrawings(
      _startPosition!,
      details.localPosition,
      style,
    );

    drawings.addAll(roundedDrawings);
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {
    final roundedDrawings = _getRoundedDrawings(
      _startPosition!,
      details.localPosition,
      style,
    );

    for (var i = 0; i < roundedDrawings.length; i++) {
      final drawing = drawings[drawings.length - roundedDrawings.length + i]
          as PathDrawingModel;

      drawing.path.reset();
      drawing.path.addPath(roundedDrawings[i].path, Offset.zero);
    }
  }

  List<PathDrawingModel> _getRoundedDrawings(
    Offset start,
    Offset end,
    RoundedToolStyle style,
  ) {
    final drawings = <PathDrawingModel>[];

    // Make rect path with rounded borders
    final rounded = Rect.fromPoints(
      Offset(
        start.dx,
        start.dy,
      ),
      Offset(
        end.dx,
        end.dy,
      ),
    );

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rounded,
          Radius.circular(_borderRadius),
        ),
      );

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

    if (style == RoundedToolStyle.borderFill ||
        style == RoundedToolStyle.fill) {
      final innerRounded = rounded.inflate(-_borderWidth / 2);

      final path = Path()
        ..addRRect(
          RRect.fromRectAndRadius(
            innerRounded,
            Radius.circular(_borderRadius),
          ),
        );

      final paint = Paint()
        ..color = style == RoundedToolStyle.borderFill
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
  void onSelectType(RoundedToolStyle value) {
    style = value;
  }

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}

enum RoundedToolStyle {
  border,
  borderFill,
  fill,
}
