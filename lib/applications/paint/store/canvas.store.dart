import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';

part 'canvas.store.g.dart';

class CanvasStore = CanvasStoreBase with _$CanvasStore;

abstract class CanvasStoreBase with Store {
  final PaintStoreBase paintStore;

  final canvasKey = GlobalKey();

  Uint8List canvasBytes = Uint8List(0);

  @observable
  ObservableList<DrawingModel> drawings = ObservableList.of([]);

  @observable
  DrawingModel? currentDrawing;

  CanvasStoreBase(this.paintStore) {
    _init();
  }

  void _init() async {
    drawings.add(
      FillDrawingModel(
        paint: Paint()..color = Colors.white,
      ),
    );

    currentDrawing = drawings.last;

    await Future<void>.delayed(Duration.zero);

    _captureCanvas();
  }

  @action
  void onStart(DragStartDetails details) {
    paintStore.toolsStore.currentTool?.onStart(
      drawings,
      details,
    );

    currentDrawing = drawings.last;
  }

  @action
  void onUpdate(DragUpdateDetails details) {
    paintStore.toolsStore.currentTool?.onUpdate(
      drawings,
      details,
    );

    currentDrawing = currentDrawing;
  }

  @action
  void onEnd(DragEndDetails details) {
    paintStore.toolsStore.currentTool?.onEnd(
      drawings,
      details,
    );

    currentDrawing = null;

    _captureCanvas();
  }

  void forceUpdate() {
    currentDrawing = currentDrawing;
  }

  Future<void> _captureCanvas() async {
    final boundary =
        canvasKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    if (boundary?.debugNeedsPaint == true) {
      return;
    }

    final image = await boundary?.toImage();

    final byteData = await image?.toByteData();

    final bytes = byteData?.buffer.asUint8List();

    // Remove every 4th byte (alpha)
    final rgbBytes = bytes?.whereIndexed((index, _) => index % 4 != 3).toList();

    canvasBytes = Uint8List.fromList(rgbBytes!);
  }
}
