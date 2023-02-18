import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/canvas.tool.dart';
import 'package:provider/provider.dart';

class CursorIcon extends StatelessWidget {
  const CursorIcon({Key? key}) : super(key: key);

  static const _toolTypesWithAsset = [
    CanvasToolType.pencil,
    CanvasToolType.spray,
    CanvasToolType.fill,
    CanvasToolType.zoom,
    CanvasToolType.brush,
    CanvasToolType.eraser,
  ];

  Widget _buildIcon(CanvasTool currentTool) {
    if (_toolTypesWithAsset.contains(currentTool.type)) {
      return Image.asset(
        currentTool.iconPath,
      );
    }

    return const Icon(Icons.add);
  }

  @override
  Widget build(BuildContext context) {
    final toolsStore = context.read<PaintStore>().toolsStore;

    return Observer(
      builder: (_) => SizedBox(
        width: 25,
        height: 25,
        child: _buildIcon(toolsStore.currentTool!),
      ),
    );
  }
}
