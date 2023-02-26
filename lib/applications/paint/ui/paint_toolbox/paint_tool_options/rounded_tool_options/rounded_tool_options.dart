import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_windows_xp/applications/paint/store/tools/rounded.tool.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_toolbox/paint_tool_options/rect_tool_options/rect_tool_option.dart';
import '../option_box/option_box.dart';

class RoundedToolOptions extends StatelessWidget {
  final RoundedTool tool;

  const RoundedToolOptions({
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
              onTap: () => tool.onSelectType(RoundedToolStyle.border),
              selected: tool.style == RoundedToolStyle.border,
              child: Center(
                child: RectToolOption(
                  active: tool.style == RoundedToolStyle.border,
                  showBorder: true,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          Expanded(
            child: OptionBox(
              onTap: () => tool.onSelectType(RoundedToolStyle.borderFill),
              selected: tool.style == RoundedToolStyle.borderFill,
              child: Center(
                child: RectToolOption(
                  active: tool.style == RoundedToolStyle.borderFill,
                  showBorder: true,
                  backgroundColor: const Color(0xff808080),
                ),
              ),
            ),
          ),
          Expanded(
            child: OptionBox(
              onTap: () => tool.onSelectType(RoundedToolStyle.fill),
              selected: tool.style == RoundedToolStyle.fill,
              child: Center(
                child: RectToolOption(
                  active: tool.style == RoundedToolStyle.fill,
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
