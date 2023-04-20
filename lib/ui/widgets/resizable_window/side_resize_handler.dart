import 'package:flutter/material.dart';

class SideResizeHandler extends StatelessWidget {
  final ValueChanged<Offset> onUpdate;
  final MouseCursor cursor;

  const SideResizeHandler({
    Key? key,
    required this.onUpdate,
    required this.cursor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => onUpdate(details.delta),
      child: MouseRegion(
        cursor: cursor,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
