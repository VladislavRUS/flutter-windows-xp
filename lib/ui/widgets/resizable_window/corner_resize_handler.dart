import 'package:flutter/material.dart';

class CornerResizeHandler extends StatelessWidget {
  final ValueChanged<Offset> onUpdate;
  final double size;

  const CornerResizeHandler({
    Key? key,
    required this.onUpdate,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => onUpdate(details.delta),
      child: MouseRegion(
        cursor: SystemMouseCursors.precise,
        child: Container(
          width: size,
          height: size,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
