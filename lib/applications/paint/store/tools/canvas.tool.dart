import 'package:flutter/cupertino.dart';
import 'package:flutter_windows_xp/applications/paint/models/drawing.model.dart';

abstract class CanvasTool {
  void onStart(DrawingModel drawing, DragStartDetails details);
  void onUpdate(DrawingModel drawing, DragUpdateDetails details);
  void onEnd(DrawingModel drawing, DragEndDetails details);
}
