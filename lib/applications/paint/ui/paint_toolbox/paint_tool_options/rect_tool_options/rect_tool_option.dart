import 'package:flutter/material.dart';

class RectToolOption extends StatelessWidget {
  final bool active;
  final bool showBorder;
  final Color backgroundColor;

  const RectToolOption({
    Key? key,
    required this.active,
    required this.showBorder,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: showBorder
            ? Border.all(
                color: active ? Colors.white : Colors.black,
                width: 1,
              )
            : null,
      ),
    );
  }
}
