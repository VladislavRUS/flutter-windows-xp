import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/models/paint_tool.model.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:provider/provider.dart';

class CanvasCursor extends StatelessWidget {
  final Widget child;

  const CanvasCursor({
    Key? key,
    required this.child,
  }) : super(key: key);

  SystemMouseCursor _getCursor(PaintToolModel currentTool) {
    // Need Flutter API to support more cursors
    // https://github.com/flutter/flutter/issues/31952

    if (currentTool.type == PaintToolType.zoom) {
      return SystemMouseCursors.zoomIn;
    }

    return SystemMouseCursors.precise;
  }

  @override
  Widget build(BuildContext context) {
    final toolsStore = context.read<PaintStore>().toolsStore;

    return Observer(
      builder: (_) => MouseRegion(
        cursor: _getCursor(toolsStore.currentTool!),
        child: child,
      ),
    );
  }
}
