import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/ellipsis.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/eraser.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/line.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/rect.tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/rounded.tool.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_toolbox/paint_tool_options/ellipsis_tool_options/ellipsis_tool_options.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_toolbox/paint_tool_options/line_tool_options/line_tool_options.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_toolbox/paint_tool_options/rect_tool_options/rect_tool_options.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_toolbox/paint_tool_options/rounded_tool_options/rounded_tool_options.dart';
import 'package:provider/provider.dart';

import 'eraser_tool_options/eraser_tool_options.dart';

class PaintToolOptions extends StatelessWidget {
  const PaintToolOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paintStore = context.watch<PaintStore>();
    final toolsStore = paintStore.toolsStore;

    return Container(
      width: 41,
      height: 66,
      decoration: const BoxDecoration(
        color: Color(0xffC0C0C0),
        border: Border(
          left: BorderSide(color: Color.fromRGBO(128, 128, 128, 1)),
          top: BorderSide(color: Color.fromRGBO(128, 128, 128, 1)),
          bottom: BorderSide(color: Colors.white),
          right: BorderSide(color: Colors.white),
        ),
      ),
      child: Observer(
        builder: (_) => _buildChild(toolsStore),
      ),
    );
  }

  Widget _buildChild(ToolsStore toolsStore) {
    switch (toolsStore.currentTool?.type) {
      case CanvasToolType.eraser:
        return EraserToolOptions(tool: toolsStore.currentTool as EraserTool);
      case CanvasToolType.line:
        return LineToolOptions(tool: toolsStore.currentTool as LineTool);
      case CanvasToolType.rect:
        return RectToolOptions(tool: toolsStore.currentTool as RectTool);
      case CanvasToolType.ellipsis:
        return EllipsisToolOptions(
          tool: toolsStore.currentTool as EllipsisTool,
        );
      case CanvasToolType.rounded:
        return RoundedToolOptions(
          tool: toolsStore.currentTool as RoundedTool,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
