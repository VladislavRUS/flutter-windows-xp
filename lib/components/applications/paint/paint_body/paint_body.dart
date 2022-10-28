import 'package:flutter/material.dart';

import 'paint_canvas/paint_canvas.dart';

class PaintBody extends StatelessWidget {
  const PaintBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff808080),
        border: Border(
          left: BorderSide(color: Colors.black, width: 1),
          bottom: BorderSide(color: Color(0xffC0C0C0), width: 2),
          right: BorderSide(color: Color(0xffC0C0C0), width: 2),
        ),
      ),
      padding: const EdgeInsets.all(4),
      alignment: Alignment.topLeft,
      child: const PaintCanvas(),
    );
  }
}
