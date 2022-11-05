class PaintTool {
  final PaintToolType type;
  final String iconPath;

  PaintTool({
    required this.type,
    required this.iconPath,
  });
}

enum PaintToolType {
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
