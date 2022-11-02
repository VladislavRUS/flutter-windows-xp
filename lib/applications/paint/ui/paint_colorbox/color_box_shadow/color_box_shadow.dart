import 'package:flutter/material.dart';

class ColorBoxShadow extends StatelessWidget {
  final Widget child;

  const ColorBoxShadow({
    Key? key,
    required this.child,
  }) : super(key: key);

  BoxBorder get _border {
    return const Border(
      left: BorderSide(color: Colors.black),
      top: BorderSide(color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: _border),
      child: child,
    );
  }
}
