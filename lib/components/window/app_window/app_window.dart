import 'package:flutter/material.dart';

import 'app_content/app_content.dart';
import 'app_header/app_header.dart';

class AppWindow extends StatelessWidget {
  final Widget child;
  final Widget header;
  final bool focused;
  final DragUpdateCallback onDragUpdate;

  const AppWindow({
    Key? key,
    required this.header,
    required this.child,
    required this.focused,
    required this.onDragUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Draggable(
                feedback: const SizedBox.shrink(),
                onDragUpdate: onDragUpdate,
                child: AppHeader(
                  header: header,
                  focused: focused,
                ),
              ),
              Expanded(
                child: AppContent(
                  focused: focused,
                  child: child,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
