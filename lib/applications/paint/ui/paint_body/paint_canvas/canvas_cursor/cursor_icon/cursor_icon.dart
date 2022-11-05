import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/models/paint_tool.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:provider/provider.dart';

class CursorIcon extends StatelessWidget {
  const CursorIcon({Key? key}) : super(key: key);

  static const _toolTypesWithAsset = [
    PaintToolType.pencil,
    PaintToolType.spray,
    PaintToolType.fill,
    PaintToolType.zoom,
    PaintToolType.brush,
    PaintToolType.eraser,
  ];

  Widget _buildIcon(PaintTool currentTool) {
    if (_toolTypesWithAsset.contains(currentTool.type)) {
      return ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.saturation,
        ),
        child: Image.asset(
          currentTool.iconPath,
        ),
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
