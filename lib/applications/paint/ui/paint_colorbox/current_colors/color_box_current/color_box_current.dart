import 'package:flutter/material.dart';

class ColorBoxCurrent extends StatelessWidget {
  final Color color;

  const ColorBoxCurrent({
    Key? key,
    required this.color,
  }) : super(key: key);

  BoxBorder get _border {
    return const Border(
      left: BorderSide(
        color: Colors.white,
      ),
      top: BorderSide(
        color: Colors.white,
      ),
      right: BorderSide(
        color: Color.fromRGBO(128, 128, 128, 1),
      ),
      bottom: BorderSide(
        color: Color.fromRGBO(128, 128, 128, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: color,
        border: _border,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: const Color.fromRGBO(192, 192, 192, 1),
          ),
        ),
      ),
    );
  }
}
