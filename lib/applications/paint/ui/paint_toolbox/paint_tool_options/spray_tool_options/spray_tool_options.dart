import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/spray.tool.dart';

import '../option_box/option_box.dart';
import 'spray_tool_option.dart';

class SprayToolOptions extends StatelessWidget {
  final SprayTool tool;

  const SprayToolOptions({
    Key? key,
    required this.tool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallSize = tool.availableSizes[0];
    final mediumSize = tool.availableSizes[1];
    final largeSize = tool.availableSizes[2];

    return Observer(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  Expanded(
                    child: OptionBox(
                      selected: tool.size == smallSize,
                      child: Center(
                        child: SprayToolOption(
                          active: tool.size == smallSize,
                          size: smallSize,
                        ),
                      ),
                      onTap: () => tool.onSelectSize(smallSize),
                    ),
                  ),
                  Expanded(
                    child: OptionBox(
                      selected: tool.size == mediumSize,
                      child: Center(
                        child: SprayToolOption(
                          active: tool.size == mediumSize,
                          size: mediumSize,
                        ),
                      ),
                      onTap: () => tool.onSelectSize(mediumSize),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionBox(
                  selected: tool.size == largeSize,
                  child: Center(
                    child: SprayToolOption(
                      active: tool.size == largeSize,
                      size: largeSize,
                    ),
                  ),
                  onTap: () => tool.onSelectSize(largeSize),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
