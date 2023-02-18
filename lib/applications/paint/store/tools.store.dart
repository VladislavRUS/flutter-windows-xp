import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/eraser.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/pencil.tool.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';
import 'tools/canvas.tool.dart';
import 'tools/stub.tool.dart';

part 'tools.store.g.dart';

class ToolsStore = ToolsStoreBase with _$ToolsStore;

abstract class ToolsStoreBase with Store {
  final PaintStoreBase paintStore;
  final List<CanvasTool> availableTools = [];

  ToolsStoreBase(this.paintStore) {
    availableTools.addAll([
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.select,
        iconPath: Assets.apps.paint.toolSelect.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.squareSelect,
        iconPath: Assets.apps.paint.toolSquareSelect.path,
      ),
      EraserTool(
        paintStore.colorsStore,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.fill,
        iconPath: Assets.apps.paint.toolFill.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.picker,
        iconPath: Assets.apps.paint.toolPicker.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.zoom,
        iconPath: Assets.apps.paint.toolZoom.path,
      ),
      PencilTool(
        paintStore.colorsStore,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.spray,
        iconPath: Assets.apps.paint.toolSpray.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.text,
        iconPath: Assets.apps.paint.toolText.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.line,
        iconPath: Assets.apps.paint.toolLine.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.rect,
        iconPath: Assets.apps.paint.toolRect.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.poly,
        iconPath: Assets.apps.paint.toolPoly.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.ellipsis,
        iconPath: Assets.apps.paint.toolEllipsis.path,
      ),
      StubTool(
        paintStore.colorsStore,
        type: CanvasToolType.rounded,
        iconPath: Assets.apps.paint.toolRounded.path,
      ),
    ]);

    currentTool = availableTools.firstWhere(
      (element) => element.type == CanvasToolType.pencil,
    );
  }

  @observable
  CanvasTool? currentTool;

  @action
  void setCurrentTool(CanvasTool tool) {
    currentTool = tool;
  }

  bool isToolSelected(CanvasTool tool) {
    return currentTool == tool;
  }
}
