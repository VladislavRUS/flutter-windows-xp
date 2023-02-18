import 'package:flutter/material.dart';

import 'paint_tool_options/paint_tool_options.dart';
import 'paint_tools/paint_tools.dart';

class PaintToolbox extends StatelessWidget {
  const PaintToolbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffC0C0C0),
        border:
            Border(bottom: BorderSide(color: Color.fromRGBO(128, 128, 128, 1))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          PaintTools(),
          SizedBox(
            height: 3,
          ),
          PaintToolOptions(),
        ],
      ),
    );
  }
}
