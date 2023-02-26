import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';

part 'canvas.store.g.dart';

class CanvasStore = CanvasStoreBase with _$CanvasStore;

abstract class CanvasStoreBase with Store {
  final PaintStoreBase paintStore;

  final canvasKey = GlobalKey();

  @observable
  ObservableList<DrawingModel> drawings = ObservableList.of([]);

  @observable
  DrawingModel? currentDrawing;

  CanvasStoreBase(this.paintStore) {
    drawings.add(
      FillDrawingModel(
        paint: Paint()..color = Colors.white,
      ),
    );

    currentDrawing = drawings.last;
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
  }
}
