import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/app_window/app_content/app_content.dart';
import 'package:flutter_windows_xp/components/app_window/app_header/app_header.dart';
import 'package:flutter_windows_xp/components/app_window/app_resize_anchor/app_resize_anchor.dart';

class AppWindow extends StatefulWidget {
  final Widget child;

  const AppWindow({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AppWindow> createState() => _AppWindowState();
}

class _AppWindowState extends State<AppWindow> {
  final _minWidth = 100;
  final _minHeight = 100;

  var _width = 600.0;
  var _height = 600.0;
  var _left = 0.0;
  var _top = 0.0;

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _left += details.delta.dx;
      _top += details.delta.dy;
    });
  }

  bool _checkSize(double nextWidth, double nextHeight) {
    if (nextWidth < _minWidth) {
      return false;
    }

    if (nextHeight < _minHeight) {
      return false;
    }

    return true;
  }

  void _onDragTopLeftCorner(DragUpdateDetails details) {
    final nextWidth = _width - details.delta.dx;
    final nextHeight = _height - details.delta.dy;

    if (!_checkSize(nextWidth, nextHeight)) {
      return;
    }

    setState(() {
      _left += details.delta.dx;
      _top += details.delta.dy;

      _width = nextWidth;
      _height = nextHeight;
    });
  }

  void _onDragTopRightCorner(DragUpdateDetails details) {
    final nextWidth = _width + details.delta.dx;
    final nextHeight = _height - details.delta.dy;

    if (!_checkSize(nextWidth, nextHeight)) {
      return;
    }

    setState(() {
      _width = nextWidth;
      _height = nextHeight;

      _top += details.delta.dy;
    });
  }

  void _onDragBottomRightCorner(DragUpdateDetails details) {
    final nextWidth = _width + details.delta.dx;
    final nextHeight = _height + details.delta.dy;

    if (!_checkSize(nextWidth, nextHeight)) {
      return;
    }

    setState(() {
      _width = nextWidth;
      _height = nextHeight;
    });
  }

  void _onDragBottomLeftCorner(DragUpdateDetails details) {
    final nextWidth = _width - details.delta.dx;
    final nextHeight = _height + details.delta.dy;

    if (!_checkSize(nextWidth, nextHeight)) {
      return;
    }

    setState(() {
      _left += details.delta.dx;

      _width = nextWidth;
      _height = nextHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _left,
      top: _top,
      width: _width,
      height: _height,
      child: ClipRRect(
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
                  onDragUpdate: _onDragUpdate,
                  child: const AppHeader(),
                ),
                Expanded(child: AppContent(child: widget.child)),
              ],
            ),
            Positioned(
              left: 0,
              top: 0,
              child: AppResizeAnchor(
                onDragUpdate: _onDragTopLeftCorner,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: AppResizeAnchor(
                onDragUpdate: _onDragTopRightCorner,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: AppResizeAnchor(
                onDragUpdate: _onDragBottomRightCorner,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: AppResizeAnchor(
                onDragUpdate: _onDragBottomLeftCorner,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
