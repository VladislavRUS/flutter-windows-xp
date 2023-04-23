import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_windows_xp/applications/paint/data/stores/tools/eraser.tool.dart';
import '../option_box/option_box.dart';

class EraserToolOptions extends StatelessWidget {
  final EraserTool tool;

  const EraserToolOptions({
    Key? key,
    required this.tool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final size in tool.availableSizes)
            Expanded(
              child: OptionBox(
                onTap: () => tool.onSelectSize(size),
                selected: tool.size == size,
                child: Center(
                  child: Container(
                    width: size,
                    height: size,
                    color: tool.size == size ? Colors.white : Colors.black,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
