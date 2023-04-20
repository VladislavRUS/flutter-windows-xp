import 'package:flutter/material.dart';

class DraggableHandler extends StatelessWidget {
  final Widget child;
  final ValueChanged<Offset> onUpdate;

  const DraggableHandler({
    Key? key,
    required this.child,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      onDragUpdate: (details) => onUpdate(details.delta),
      feedback: const SizedBox.shrink(),
      child: child,
    );
  }
}
