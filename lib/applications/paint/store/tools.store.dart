import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/ellipsis.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/eraser.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/fill.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/pencil.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/poly.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/rect.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/rounded.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/spray.tool.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'tools/canvas.tool.dart';
import 'tools/line.tool.dart';
import 'tools/picker.tool.dart';
import 'tools/stub.tool.dart';

part 'tools.store.g.dart';

class ToolsStore = ToolsStoreBase with _$ToolsStore;

abstract class ToolsStoreBase with Store {
  final PaintStoreBase paintStore;
  final List<CanvasTool> availableTools = [];

  @observable
  CanvasTool? currentTool;

  ToolsStoreBase(this.paintStore) {
    availableTools.addAll([
      StubTool(
        paintStore,
        type: CanvasToolType.select,
        iconPath: Assets.applications.paint.toolSelect.path,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.squareSelect,
        iconPath: Assets.applications.paint.toolSquareSelect.path,
      ),
      EraserTool(
        paintStore,
      ),
      FillTool(
        paintStore,
      ),
      PickerTool(
        paintStore,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.zoom,
        iconPath: Assets.applications.paint.toolZoom.path,
      ),
      PencilTool(
        paintStore,
      ),
      SprayTool(
        paintStore,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.text,
        iconPath: Assets.applications.paint.toolText.path,
      ),
      LineTool(
        paintStore,
      ),
      RectTool(
        paintStore,
      ),
      PolyTool(
        paintStore,
      ),
      EllipsisTool(
        paintStore,
      ),
      RoundedTool(
        paintStore,
      ),
    ]);

    currentTool = availableTools.firstWhere(
      (element) => element.type == CanvasToolType.pencil,
    );
  }

  @action
  void setCurrentTool(CanvasTool tool) {
    final prevTool = currentTool;

    currentTool = tool;

    if (prevTool != null) {
      prevTool.onDeselected();
    }

    currentTool?.onSelected();
  }

  bool isToolSelected(CanvasTool tool) {
    return currentTool == tool;
  }
}
