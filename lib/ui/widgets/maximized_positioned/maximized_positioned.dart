import 'package:flutter/material.dart';

class MaximizedPositioned extends StatefulWidget {
  final Widget child;
  final double left;
  final double top;
  final double width;
  final double height;
  final Duration duration;
  final bool maximized;

  const MaximizedPositioned({
    Key? key,
    required this.child,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    required this.duration,
    required this.maximized,
  }) : super(key: key);

  @override
  State<MaximizedPositioned> createState() => _MaximizedPositionedState();
}

class _MaximizedPositionedState extends State<MaximizedPositioned> {
  var _duration = Duration.zero;

  @override
  void initState() {
    super.initState();

    _initDuration();
  }

  void _initDuration() {
    if (widget.maximized) {
      _duration = widget.duration;
    } else {
      _duration = Duration.zero;
    }
  }

  void _onEnd() {
    _initDuration();
  }

  @override
  void didUpdateWidget(covariant MaximizedPositioned oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.maximized != widget.maximized && widget.maximized) {
      _initDuration();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMaximized = widget.maximized;

    final left = isMaximized ? 0.0 : widget.left;
    final top = isMaximized ? 0.0 : widget.top;

    final width =
        isMaximized ? MediaQuery.of(context).size.width : widget.width;
    final height =
        isMaximized ? MediaQuery.of(context).size.height : widget.height;

    return AnimatedPositioned(
      duration: _duration,
      curve: Curves.easeInOut,
      onEnd: _onEnd,
      left: left,
      top: top,
      width: width,
      height: height,
      child: widget.child,
    );
  }
}
