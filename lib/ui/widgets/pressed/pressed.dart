import 'package:flutter/material.dart';

class Pressed extends StatefulWidget {
  final VoidCallback onPress;
  final Widget Function(BuildContext, bool) builder;

  const Pressed({
    Key? key,
    required this.onPress,
    required this.builder,
  }) : super(key: key);

  @override
  State<Pressed> createState() => _PressedState();
}

class _PressedState extends State<Pressed> {
  bool _pressed = false;

  void _onTapDown(BuildContext context) {
    setState(() {
      _pressed = true;
    });
  }

  void _onTapUp(BuildContext context) {
    setState(() {
      _pressed = false;
    });
  }

  void _onTapCancel(BuildContext context) {
    setState(() {
      _pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onTapDown(context),
      onTapUp: (_) => _onTapUp(context),
      onTapCancel: () => _onTapCancel(context),
      onTap: widget.onPress,
      child: widget.builder(context, _pressed),
    );
  }
}
