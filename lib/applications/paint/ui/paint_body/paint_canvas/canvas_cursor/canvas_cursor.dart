import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_body/paint_canvas/canvas_cursor/cursor_icon/cursor_icon.dart';

class CanvasCursor extends StatefulWidget {
  final Widget child;

  const CanvasCursor({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<CanvasCursor> createState() => _CanvasCursorIconState();
}

class _CanvasCursorIconState extends State<CanvasCursor> {
  double? _x;
  double? _y;

  void _onEnter(PointerEnterEvent event) {
    setState(() {
      _x = event.localPosition.dx;
      _y = event.localPosition.dy;
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() {
      _x = null;
      _y = null;
    });
  }

  void _onHover(PointerHoverEvent event) {
    setState(() {
      _x = event.localPosition.dx;
      _y = event.localPosition.dy;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _x = details.localPosition.dx;
      _y = details.localPosition.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      onHover: _onHover,
      cursor: SystemMouseCursors.none,
      child: GestureDetector(
        onPanUpdate: _onPanUpdate,
        child: Stack(
          children: [
            Positioned.fill(child: widget.child),
            if (_x != null && _y != null)
              Positioned(
                left: _x,
                top: _y,
                child: const CursorIcon(),
              ),
          ],
        ),
      ),
    );
  }
}
