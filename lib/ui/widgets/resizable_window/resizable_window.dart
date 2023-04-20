import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/ui/widgets/resizable_window/corner_resize_handler.dart';
import 'side_resize_handler.dart';

class ResizableWindow extends StatefulWidget {
  final Widget child;
  final ValueChanged<Offset> onTopUpdate;
  final ValueChanged<Offset> onRightUpdate;
  final ValueChanged<Offset> onBottomUpdate;
  final ValueChanged<Offset> onLeftUpdate;
  final ValueChanged<Offset> onTopLeftUpdate;
  final ValueChanged<Offset> onTopRightUpdate;
  final ValueChanged<Offset> onBottomRightUpdate;
  final ValueChanged<Offset> onBottomLeftUpdate;
  final bool disabled;

  const ResizableWindow({
    Key? key,
    required this.child,
    required this.onTopUpdate,
    required this.onRightUpdate,
    required this.onBottomUpdate,
    required this.onLeftUpdate,
    required this.onTopLeftUpdate,
    required this.onTopRightUpdate,
    required this.onBottomRightUpdate,
    required this.onBottomLeftUpdate,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<ResizableWindow> createState() => _ResizableWindowState();
}

class _ResizableWindowState extends State<ResizableWindow> {
  final _resizeHandlerSize = 10.0;

  @override
  Widget build(BuildContext context) {
    if (widget.disabled) {
      return widget.child;
    }

    return Stack(
      children: [
        widget.child,

        // Corner
        Positioned(
          left: 0,
          top: 0,
          child: CornerResizeHandler(
            onUpdate: widget.onTopLeftUpdate,
            size: _resizeHandlerSize,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: CornerResizeHandler(
            onUpdate: widget.onTopRightUpdate,
            size: _resizeHandlerSize,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CornerResizeHandler(
            onUpdate: widget.onBottomRightUpdate,
            size: _resizeHandlerSize,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: CornerResizeHandler(
            onUpdate: widget.onBottomLeftUpdate,
            size: _resizeHandlerSize,
          ),
        ),

        // Sides
        Positioned(
          top: 0,
          left: _resizeHandlerSize,
          right: _resizeHandlerSize,
          height: _resizeHandlerSize,
          child: Center(
            child: SideResizeHandler(
              onUpdate: widget.onTopUpdate,
              cursor: SystemMouseCursors.resizeUpDown,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: _resizeHandlerSize,
          bottom: _resizeHandlerSize,
          width: _resizeHandlerSize,
          child: SideResizeHandler(
            onUpdate: widget.onRightUpdate,
            cursor: SystemMouseCursors.resizeLeftRight,
          ),
        ),
        Positioned(
          bottom: 0,
          right: _resizeHandlerSize,
          left: _resizeHandlerSize,
          height: _resizeHandlerSize,
          child: SideResizeHandler(
            onUpdate: widget.onBottomUpdate,
            cursor: SystemMouseCursors.resizeUpDown,
          ),
        ),
        Positioned(
          left: 0,
          top: _resizeHandlerSize,
          bottom: _resizeHandlerSize,
          width: _resizeHandlerSize,
          child: SideResizeHandler(
            onUpdate: widget.onLeftUpdate,
            cursor: SystemMouseCursors.resizeLeftRight,
          ),
        ),
      ],
    );
  }
}
