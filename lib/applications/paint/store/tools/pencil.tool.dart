import 'package:flutter/widgets.dart';
import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/colors.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';

class PencilCanvasTool extends CanvasTool {
  final ColorsStore colorsStore;
  Offset? _lastOffset;

  PencilCanvasTool(this.colorsStore);

  @override
  void onStart(DrawingModel drawing, DragStartDetails details) {
    print('onDown');

    _lastOffset = details.localPosition;
  }

  @override
  void onUpdate(DrawingModel drawing, DragUpdateDetails details) {
    print('onMove');

    if (_lastOffset == null) {
      return;
    }

    final currentOffset = details.localPosition;
    final paint = Paint()..color = colorsStore.primaryColor;

    // canvas.drawLine(_lastOffset!, currentOffset, paint);

    print('draw');
  }

  @override
  void onEnd(DrawingModel drawing, DragEndDetails details) {}
}
