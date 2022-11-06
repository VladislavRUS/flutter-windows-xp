import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:mobx/mobx.dart';

part 'canvas.store.g.dart';

class CanvasStore = CanvasStoreBase with _$CanvasStore;

abstract class CanvasStoreBase with Store {
  final PaintStoreBase paintStore;

  CanvasStoreBase(this.paintStore) {
    drawings.add(DrawingModel(
      path: Path(),
      paint: Paint()..color = Colors.white,
      type: DrawingType.background,
    ));
  }

  @observable
  ObservableList<DrawingModel> drawings = ObservableList.of([]);

  @observable
  DrawingModel? currentDrawing;

  @action
  void onStart(DragStartDetails details) {
    final path = Path();

    path.moveTo(details.localPosition.dx, details.localPosition.dy);

    final paint = Paint();
    paint.color = paintStore.colorsStore.primaryColor;
    paint.style = PaintingStyle.stroke;

    currentDrawing = DrawingModel(
      paint: paint,
      type: DrawingType.path,
      path: path,
    );
  }

  @action
  void onUpdate(DragUpdateDetails details) {
    final path = currentDrawing!.path!;

    path.lineTo(details.localPosition.dx, details.localPosition.dy);

    currentDrawing = currentDrawing;
  }

  @action
  void onEnd(DragEndDetails details) {
    drawings.add(currentDrawing!);

    currentDrawing = null;
  }
}
