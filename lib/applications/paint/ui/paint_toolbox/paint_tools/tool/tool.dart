import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/paint/data/stores/tools/canvas.tool.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class Tool extends StatefulWidget {
  final CanvasTool tool;
  final void Function(CanvasTool) onTap;
  final bool selected;
  final bool disabled;

  const Tool({
    Key? key,
    required this.tool,
    required this.onTap,
    this.selected = false,
    required this.disabled,
  }) : super(key: key);

  @override
  State<Tool> createState() => _ToolState();
}

class _ToolState extends State<Tool> {
  bool _pressed = false;

  bool get _active => _pressed || widget.selected;

  BoxBorder get _border {
    if (_active) {
      return const Border(
        top: BorderSide(
          width: 1,
          color: Colors.black,
        ),
        right: BorderSide(
          width: 1,
          color: Colors.white,
        ),
        bottom: BorderSide(
          width: 1,
          color: Colors.white,
        ),
        left: BorderSide(
          width: 1,
          color: Colors.black,
        ),
      );
    }

    return const Border(
      right: BorderSide(
        width: 1,
        color: Colors.black,
      ),
      bottom: BorderSide(
        width: 1,
        color: Colors.black,
      ),
    );
  }

  BoxBorder get _overlayBorder {
    if (_active) {
      return const Border(
        top: BorderSide(
          width: 1,
          color: Color.fromRGBO(128, 128, 128, 1),
        ),
        right: BorderSide(
          width: 1,
          color: Color.fromRGBO(192, 192, 192, 1),
        ),
        bottom: BorderSide(
          width: 1,
          color: Color.fromRGBO(192, 192, 192, 1),
        ),
        left: BorderSide(
          width: 1,
          color: Color.fromRGBO(128, 128, 128, 1),
        ),
      );
    }

    return const Border(
      top: BorderSide(
        width: 1,
        color: Colors.white,
      ),
      right: BorderSide(
        width: 1,
        color: Color.fromRGBO(128, 128, 128, 1),
      ),
      bottom: BorderSide(
        width: 1,
        color: Color.fromRGBO(128, 128, 128, 1),
      ),
      left: BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _pressed = true;
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() {
      _pressed = false;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _pressed = false;
    });

    widget.onTap(widget.tool);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.disabled,
      child: Opacity(
        opacity: widget.disabled ? 0.5 : 1,
        child: MouseRegion(
          onExit: _onExit,
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: _border,
                    image: widget.selected
                        ? DecorationImage(
                            image: AssetImage(
                              Assets.applications.paint.checker.path,
                            ),
                            repeat: ImageRepeat.repeat,
                          )
                        : null,
                  ),
                  child: Center(
                    child: Image.asset(
                      widget.tool.iconPath,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: _overlayBorder,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
