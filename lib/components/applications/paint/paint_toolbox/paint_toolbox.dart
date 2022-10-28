import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/applications/paint/paint_toolbox/paint_tools/paint_tools.dart';

class PaintToolbox extends StatelessWidget {
  const PaintToolbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC0C0C0),
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          PaintTools(),
        ],
      ),
    );
  }
}
