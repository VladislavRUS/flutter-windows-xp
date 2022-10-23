import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Hovered extends StatefulWidget {
  final Widget Function(BuildContext, bool) builder;

  const Hovered({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<Hovered> createState() => _HoveredState();
}

class _HoveredState extends State<Hovered> {
  bool _hovered = false;

  void _onEnter(PointerEnterEvent event) {
    setState(() {
      _hovered = true;
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() {
      _hovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: widget.builder(context, _hovered),
    );
  }
}
