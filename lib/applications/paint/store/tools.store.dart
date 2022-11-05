import 'package:flutter_windows_xp/applications/paint/models/paint_tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/common/assets.dart';
import 'package:mobx/mobx.dart';

part 'tools.store.g.dart';

class ToolsStore = ToolsStoreBase with _$ToolsStore;

abstract class ToolsStoreBase with Store {
  final PaintStoreBase paintStore;
  @observable
  PaintTool? currentTool;

  ToolsStoreBase(this.paintStore) {
    currentTool = availableTools.firstWhere(
      (element) => element.type == PaintToolType.pencil,
    );
  }

  List<PaintTool> availableTools = [
    PaintTool(
      type: PaintToolType.select,
      iconPath: Assets.toolSelectIcon,
    ),
    PaintTool(
      type: PaintToolType.squareSelect,
      iconPath: Assets.toolSquareSelectIcon,
    ),
    PaintTool(
      type: PaintToolType.eraser,
      iconPath: Assets.toolEraserIcon,
    ),
    PaintTool(
      type: PaintToolType.fill,
      iconPath: Assets.toolFillIcon,
    ),
    PaintTool(
      type: PaintToolType.picker,
      iconPath: Assets.toolPickerIcon,
    ),
    PaintTool(
      type: PaintToolType.zoom,
      iconPath: Assets.toolZoomIcon,
    ),
    PaintTool(
      type: PaintToolType.pencil,
      iconPath: Assets.toolPencilIcon,
    ),
    PaintTool(
      type: PaintToolType.brush,
      iconPath: Assets.toolBrushIcon,
    ),
    PaintTool(
      type: PaintToolType.spray,
      iconPath: Assets.toolSprayIcon,
    ),
    PaintTool(
      type: PaintToolType.text,
      iconPath: Assets.toolTextIcon,
    ),
    PaintTool(
      type: PaintToolType.line,
      iconPath: Assets.toolLineIcon,
    ),
    PaintTool(
      type: PaintToolType.rect,
      iconPath: Assets.toolRectIcon,
    ),
    PaintTool(
      type: PaintToolType.poly,
      iconPath: Assets.toolPolyIcon,
    ),
    PaintTool(
      type: PaintToolType.ellipsis,
      iconPath: Assets.toolEllipsisIcon,
    ),
    PaintTool(
      type: PaintToolType.rounded,
      iconPath: Assets.toolRoundedIcon,
    ),
  ];

  @action
  void setCurrentTool(PaintTool tool) {
    currentTool = tool;
  }

  bool isToolSelected(PaintTool tool) {
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
