import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/rect.tool.dart';

import '../option_box/option_box.dart';
import 'rect_tool_option.dart';

class RectToolOptions extends StatelessWidget {
  final RectTool tool;

  const RectToolOptions({
    Key? key,
    required this.tool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: OptionBox(
              onTap: () => tool.onSelectType(RectToolStyle.border),
              selected: tool.style == RectToolStyle.border,
              child: Center(
                child: RectToolOption(
                  active: tool.style == RectToolStyle.border,
                  showBorder: true,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          Expanded(
            child: OptionBox(
              onTap: () => tool.onSelectType(RectToolStyle.borderFill),
              selected: tool.style == RectToolStyle.borderFill,
              child: Center(
                child: RectToolOption(
                  active: tool.style == RectToolStyle.borderFill,
                  showBorder: true,
                  backgroundColor: const Color(0xff808080),
                ),
              ),
            ),
          ),
          Expanded(
            child: OptionBox(
              onTap: () => tool.onSelectType(RectToolStyle.fill),
              selected: tool.style == RectToolStyle.fill,
              child: Center(
                child: RectToolOption(
                  active: tool.style == RectToolStyle.fill,
                  showBorder: false,
                  backgroundColor: const Color(0xff808080),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
