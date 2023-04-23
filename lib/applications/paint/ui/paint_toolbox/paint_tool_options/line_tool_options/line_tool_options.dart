import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_windows_xp/applications/paint/data/stores/tools/line.tool.dart';
import '../option_box/option_box.dart';

class LineToolOptions extends StatelessWidget {
  final LineTool tool;

  const LineToolOptions({
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
