import 'package:flutter/material.dart';

class AppContent extends StatelessWidget {
  final Widget child;
  final bool focused;

  const AppContent({
    Key? key,
    required this.child,
    required this.focused,
  }) : super(key: key);

  Color get _borderColor => focused
      ? const Color.fromRGBO(8, 49, 217, 1)
      : const Color.fromRGBO(101, 130, 245, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: _borderColor,
            width: 3,
          ),
          right: BorderSide(
            color: _borderColor,
            width: 3,
          ),
          bottom: BorderSide(
            color: _borderColor,
            width: 3,
          ),
        ),
      ),
      child: child,
    );
  }
}
