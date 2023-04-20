import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/colors.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class PickerTool extends CanvasTool {
  Offset? _lastPosition;

  PickerTool(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.picker,
          iconPath: Assets.applications.paint.toolPicker.path,
        );

  @override
  void onStart(List<DrawingModel> drawings, DragStartDetails details) async {
    _lastPosition = details.localPosition;
  }

  @override
  void onUpdate(List<DrawingModel> drawings, DragUpdateDetails details) {
    _lastPosition = details.localPosition;
  }

  @override
  void onEnd(List<DrawingModel> drawings, DragEndDetails details) async {
    final pixel = await _getPixelColor(
      paintStore.canvasStore.canvasBytes,
      _lastPosition!,
    );

    if (pixel == null) {
      return;
    }

    paintStore.colorsStore.primaryColor = CustomColor(pixel.value);

    _lastPosition = null;
  }

  Future<Color?> _getPixelColor(
    Uint8List bytes,
    Offset position,
  ) async {
    final canvasSize = (paintStore.canvasStore.canvasKey.currentContext
        ?.findRenderObject()
        ?.paintBounds
        .size)!;

    final dx = position.dx.toInt();
    final dy = position.dy.toInt();

    final index = ((canvasSize.width * dy + dx) * 3).toInt();

    final startIndex = index - index % 3;

    final rgba = bytes.sublist(startIndex, startIndex + 3);

    return Color.fromARGB(255, rgba[0], rgba[1], rgba[2]);
  }

  @override
  void onSelected() {}

  @override
  void onDeselected() {}
}
