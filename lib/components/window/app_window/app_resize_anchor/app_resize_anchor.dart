import 'package:flutter/material.dart';

class AppResizeAnchor extends StatelessWidget {
  final DragUpdateCallback onDragUpdate;

  const AppResizeAnchor({
    Key? key,
    required this.onDragUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: const SizedBox.shrink(),
      onDragUpdate: onDragUpdate,
      child: MouseRegion(
        cursor: SystemMouseCursors.precise,
        child: Container(
          width: 10,
          height: 10,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
