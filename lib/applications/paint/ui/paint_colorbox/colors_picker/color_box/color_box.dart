import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/paint/ui/paint_colorbox/color_box_shadow/color_box_shadow.dart';

class ColorBox extends StatelessWidget {
  final Color color;
  final void Function(Color) onTap;
  final void Function(Color) onSecondaryTap;

  const ColorBox({
    Key? key,
    required this.color,
    required this.onTap,
    required this.onSecondaryTap,
  }) : super(key: key);

  BoxBorder get _border {
    return const Border(
      left: BorderSide(
        color: Color.fromRGBO(128, 128, 128, 1),
      ),
      top: BorderSide(
        color: Color.fromRGBO(128, 128, 128, 1),
      ),
      right: BorderSide(
        color: Color.fromRGBO(192, 192, 192, 1),
      ),
      bottom: BorderSide(
        color: Color.fromRGBO(192, 192, 192, 1),
      ),
    );
  }

  void _onTap() {
    onTap(color);
  }

  void _onSecondaryTap() {
    onSecondaryTap(color);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onSecondaryTap: _onSecondaryTap,
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(border: _border),
        child: ColorBoxShadow(
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }
}
