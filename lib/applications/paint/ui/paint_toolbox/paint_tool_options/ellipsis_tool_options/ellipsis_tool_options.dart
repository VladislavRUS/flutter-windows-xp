import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/ellipsis.tool.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_toolbox/paint_tool_options/rect_tool_options/rect_tool_option.dart';

import '../option_box/option_box.dart';

class EllipsisToolOptions extends StatelessWidget {
  final EllipsisTool tool;

  const EllipsisToolOptions({
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
              onTap: () => tool.onSelectType(EllipsisToolStyle.border),
              selected: tool.style == EllipsisToolStyle.border,
              child: Center(
                child: RectToolOption(
                  active: tool.style == EllipsisToolStyle.border,
                  showBorder: true,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
          Expanded(
            child: OptionBox(
              onTap: () => tool.onSelectType(EllipsisToolStyle.borderFill),
              selected: tool.style == EllipsisToolStyle.borderFill,
              child: Center(
                child: RectToolOption(
                  active: tool.style == EllipsisToolStyle.borderFill,
                  showBorder: true,
                  backgroundColor: const Color(0xff808080),
                ),
              ),
            ),
          ),
          Expanded(
            child: OptionBox(
              onTap: () => tool.onSelectType(EllipsisToolStyle.fill),
              selected: tool.style == EllipsisToolStyle.fill,
              child: Center(
                child: RectToolOption(
                  active: tool.style == EllipsisToolStyle.fill,
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
