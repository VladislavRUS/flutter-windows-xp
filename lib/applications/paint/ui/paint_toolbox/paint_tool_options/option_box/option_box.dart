import 'package:flutter/material.dart';

class OptionBox extends StatelessWidget {
  final bool selected;
  final Widget child;
  final VoidCallback onTap;

  const OptionBox({
    Key? key,
    required this.selected,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected
              ? const Color.fromRGBO(0, 0, 123, 1)
              : Colors.transparent,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: child,
          ),
        ),
      ),
    );
  }
}
