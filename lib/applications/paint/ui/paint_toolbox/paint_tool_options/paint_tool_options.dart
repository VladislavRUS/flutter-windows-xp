import 'package:flutter/material.dart';

class PaintToolOptions extends StatelessWidget {
  const PaintToolOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41,
      height: 66,
      decoration: const BoxDecoration(
        color: Color(0xffC0C0C0),
        border: Border(
          left: BorderSide(color: Color.fromRGBO(128, 128, 128, 1)),
          top: BorderSide(color: Color.fromRGBO(128, 128, 128, 1)),
          bottom: BorderSide(color: Colors.white),
          right: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
