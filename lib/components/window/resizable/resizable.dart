import 'package:flutter/material.dart';

import 'resize_anchor/resize_anchor.dart';

class Resizable extends StatelessWidget {
  final Widget child;
  final DragUpdateCallback onDragTopLeftCorner;
  final DragUpdateCallback onDragTopRightCorner;
  final DragUpdateCallback onDragBottomRightCorner;
  final DragUpdateCallback onDragBottomLeftCorner;

  const Resizable({
    Key? key,
    required this.child,
    required this.onDragTopLeftCorner,
    required this.onDragTopRightCorner,
    required this.onDragBottomRightCorner,
    required this.onDragBottomLeftCorner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          left: 0,
          top: 0,
          child: ResizeAnchor(
            onDragUpdate: onDragTopLeftCorner,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: ResizeAnchor(
            onDragUpdate: onDragTopRightCorner,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: ResizeAnchor(
            onDragUpdate: onDragBottomRightCorner,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: ResizeAnchor(
            onDragUpdate: onDragBottomLeftCorner,
          ),
        ),
      ],
    );
  }
}
