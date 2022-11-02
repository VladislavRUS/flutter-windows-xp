import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/common/assets.dart';

import 'tool/tool.dart';

class PaintTools extends StatelessWidget {
  const PaintTools({Key? key}) : super(key: key);

  List<Widget> _buildTools() {
    return [
      Tool(
        iconAsset: Assets.toolSelectIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolSquareSelectIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolEraserIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolFillIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolPickerIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolZoomIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolPencilIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolBrushIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolSprayIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolTextIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolLineIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolCurveIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolRectIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolPolyIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolEllipsisIcon,
        onTap: () {},
      ),
      Tool(
        iconAsset: Assets.toolRoundedIcon,
        onTap: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: _buildTools(),
    );
  }
}
