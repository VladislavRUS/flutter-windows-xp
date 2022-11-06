import 'package:flutter_windows_xp/applications/paint/models/paint_tool.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/common/assets.dart';
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
      iconPath: Assets.toolSelectIcon,
    ),
    PaintToolModel(
      type: PaintToolType.squareSelect,
      iconPath: Assets.toolSquareSelectIcon,
    ),
    PaintToolModel(
      type: PaintToolType.eraser,
      iconPath: Assets.toolEraserIcon,
    ),
    PaintToolModel(
      type: PaintToolType.fill,
      iconPath: Assets.toolFillIcon,
    ),
    PaintToolModel(
      type: PaintToolType.picker,
      iconPath: Assets.toolPickerIcon,
    ),
    PaintToolModel(
      type: PaintToolType.zoom,
      iconPath: Assets.toolZoomIcon,
    ),
    PaintToolModel(
      type: PaintToolType.pencil,
      iconPath: Assets.toolPencilIcon,
    ),
    PaintToolModel(
      type: PaintToolType.brush,
      iconPath: Assets.toolBrushIcon,
    ),
    PaintToolModel(
      type: PaintToolType.spray,
      iconPath: Assets.toolSprayIcon,
    ),
    PaintToolModel(
      type: PaintToolType.text,
      iconPath: Assets.toolTextIcon,
    ),
    PaintToolModel(
      type: PaintToolType.line,
      iconPath: Assets.toolLineIcon,
    ),
    PaintToolModel(
      type: PaintToolType.rect,
      iconPath: Assets.toolRectIcon,
    ),
    PaintToolModel(
      type: PaintToolType.poly,
      iconPath: Assets.toolPolyIcon,
    ),
    PaintToolModel(
      type: PaintToolType.ellipsis,
      iconPath: Assets.toolEllipsisIcon,
    ),
    PaintToolModel(
      type: PaintToolType.rounded,
      iconPath: Assets.toolRoundedIcon,
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
