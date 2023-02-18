import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/store/canvas.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/colors.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools.store.dart';

part 'paint.store.g.dart';

class PaintStore = PaintStoreBase with _$PaintStore;

abstract class PaintStoreBase with Store {
  late ColorsStore colorsStore;
  late ToolsStore toolsStore;
  late CanvasStore canvasStore;

  PaintStoreBase() {
    colorsStore = ColorsStore(this);
    toolsStore = ToolsStore(this);
    canvasStore = CanvasStore(this);
  }
}
