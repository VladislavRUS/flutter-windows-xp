import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/paint/data/stores/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/data/stores/tools/stub.tool.dart';
import 'tool/tool.dart';

class PaintTools extends StatelessWidget {
  const PaintTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toolsStore = context.read<PaintStore>().toolsStore;

    return Observer(
      builder: (_) => GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        children: toolsStore.availableTools
            .map(
              (tool) => Tool(
                tool: tool,
                onTap: toolsStore.setCurrentTool,
                selected: toolsStore.isToolSelected(tool),
                disabled: tool is StubTool,
              ),
            )
            .toList(),
      ),
    );
  }
}
