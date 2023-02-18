import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/colors.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';
import 'package:collection/collection.dart';

class PickerTool extends CanvasTool {
  Offset? _lastPosition;

  PickerTool(PaintStoreBase paintStore)
      : super(
          paintStore,
          type: CanvasToolType.picker,
          iconPath: Assets.apps.paint.toolPicker.path,
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
    final canvasBytes = await _captureCanvas();

    if (canvasBytes == null) {
      return;
    }

    final pixel = await _getPixelColor(
      canvasBytes,
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

  Future<Uint8List?> _captureCanvas() async {
    final boundary = paintStore.canvasStore.canvasKey.currentContext
        ?.findRenderObject() as RenderRepaintBoundary?;

    final image = await boundary?.toImage();

    final byteData = await image?.toByteData();

    final bytes = byteData?.buffer.asUint8List();

    // Remove every 4th byte (alpha)
    final rgbBytes = bytes?.whereIndexed((index, _) => index % 4 != 3).toList();

    return Uint8List.fromList(rgbBytes!);
  }
}
