import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/paint/data/stores/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/tools/canvas.tool.dart';

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
