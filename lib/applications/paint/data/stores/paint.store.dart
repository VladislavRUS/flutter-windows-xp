import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/data/stores/canvas.store.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/colors.store.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/tools.store.dart';

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
