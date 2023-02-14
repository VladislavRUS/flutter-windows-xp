import 'package:flutter_windows_xp/applications/paint/models/paint_tool.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';
import 'package:mobx/mobx.dart';

part 'tools.store.g.dart';

class ToolsStore = ToolsStoreBase with _$ToolsStore;

abstract class ToolsStoreBase with Store {
  final PaintStoreBase paintStore;

  ToolsStoreBase(this.paintStore) {
    currentTool = availableTools.firstWhere(
      (element) => element.type == PaintToolType.pencil,
    );
  }

  @observable
  PaintToolModel? currentTool;

  List<PaintToolModel> availableTools = [
    PaintToolModel(
      type: PaintToolType.select,
      iconPath: Assets.apps.paint.toolSelect.path,
    ),
    PaintToolModel(
      type: PaintToolType.squareSelect,
      iconPath: Assets.apps.paint.toolSquareSelect.path,
    ),
    PaintToolModel(
      type: PaintToolType.eraser,
      iconPath: Assets.apps.paint.toolEraser.path,
    ),
    PaintToolModel(
      type: PaintToolType.fill,
      iconPath: Assets.apps.paint.toolFill.path,
    ),
    PaintToolModel(
      type: PaintToolType.picker,
      iconPath: Assets.apps.paint.toolPicker.path,
    ),
    PaintToolModel(
      type: PaintToolType.zoom,
      iconPath: Assets.apps.paint.toolZoom.path,
    ),
    PaintToolModel(
      type: PaintToolType.pencil,
      iconPath: Assets.apps.paint.toolPencil.path,
    ),
    PaintToolModel(
      type: PaintToolType.brush,
      iconPath: Assets.apps.paint.toolBrush.path,
    ),
    PaintToolModel(
      type: PaintToolType.spray,
      iconPath: Assets.apps.paint.toolSpray.path,
    ),
    PaintToolModel(
      type: PaintToolType.text,
      iconPath: Assets.apps.paint.toolText.path,
    ),
    PaintToolModel(
      type: PaintToolType.line,
      iconPath: Assets.apps.paint.toolLine.path,
    ),
    PaintToolModel(
      type: PaintToolType.rect,
      iconPath: Assets.apps.paint.toolRect.path,
    ),
    PaintToolModel(
      type: PaintToolType.poly,
      iconPath: Assets.apps.paint.toolPoly.path,
    ),
    PaintToolModel(
      type: PaintToolType.ellipsis,
      iconPath: Assets.apps.paint.toolEllipsis.path,
    ),
    PaintToolModel(
      type: PaintToolType.rounded,
      iconPath: Assets.apps.paint.toolRounded.path,
    ),
  ];

  @action
  void setCurrentTool(PaintToolModel tool) {
    currentTool = tool;
  }

  bool isToolSelected(PaintToolModel tool) {
    return currentTool == tool;
  }
}

enum ToolType {
  select,
  squareSelect,
  eraser,
  fill,
  picker,
  zoom,
  pencil,
  brush,
  spray,
  text,
  line,
  curve,
  rect,
  poly,
  ellipsis,
  rounded,
}
