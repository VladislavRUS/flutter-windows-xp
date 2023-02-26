import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

part 'spray.tool.g.dart';

class SprayTool = SprayToolBase with _$SprayTool;

abstract class SprayToolBase extends CanvasTool with Store {
  SprayToolBase(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.spray,
          iconPath: Assets.apps.paint.toolSpray.path,
        );

  @observable
  double size = 10;

  final availableSizes = <double>[10, 15, 20];

  Timer? _timer;
  Offset? _currentPosition;

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) {
    _currentPosition = details.localPosition;

    _onFillSprayCircle(
      drawings,
    );

    _timer = Timer.periodic(
      const Duration(milliseconds: 25),
      (timer) {
        _onFillSprayCircle(
          drawings,
        );

        paintStore.canvasStore.forceUpdate();
      },
    );
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {
    _currentPosition = details.localPosition;
  }

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) {
    _timer?.cancel();
  }

  void _onFillSprayCircle(List<DrawingModel> drawings) {
    final points = <Offset>[];
    final radius = size;
    final center = _currentPosition!;

    final paint = Paint()
      ..color = paintStore.colorsStore.primaryColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    // Fill random points inside circle
    final random = Random();

    for (var i = 0; i < 5 * radius; i++) {
      final angle = random.nextDouble() * 2 * pi;
      final distance = random.nextDouble() * radius;

      final x = center.dx + distance * cos(angle);
      final y = center.dy + distance * sin(angle);

      points.add(Offset(x, y));
    }

    drawings.add(
      PointsDrawingModel(
        points: points,
        paint: paint,
        pointMode: PointMode.points,
      ),
    );
  }

  @action
  void onSelectSize(double value) {
    size = value;
  }

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}
