import 'package:flutter_windows_xp/applications/paint/store/tools/fill.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/rect.tool.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/eraser.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/pencil.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';
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
        iconPath: Assets.apps.paint.toolSelect.path,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.squareSelect,
        iconPath: Assets.apps.paint.toolSquareSelect.path,
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
        iconPath: Assets.apps.paint.toolZoom.path,
      ),
      PencilTool(
        paintStore,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.spray,
        iconPath: Assets.apps.paint.toolSpray.path,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.text,
        iconPath: Assets.apps.paint.toolText.path,
      ),
      LineTool(
        paintStore,
      ),
      RectTool(
        paintStore,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.poly,
        iconPath: Assets.apps.paint.toolPoly.path,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.ellipsis,
        iconPath: Assets.apps.paint.toolEllipsis.path,
      ),
      StubTool(
        paintStore,
        type: CanvasToolType.rounded,
        iconPath: Assets.apps.paint.toolRounded.path,
      ),
    ]);

    currentTool = availableTools.firstWhere(
      (element) => element.type == CanvasToolType.pencil,
    );
  }

  @action
  void setCurrentTool(CanvasTool tool) {
    currentTool = tool;
  }

  bool isToolSelected(CanvasTool tool) {
    return currentTool == tool;
  }
}
