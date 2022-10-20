import 'package:flutter/material.dart';

class AppContent extends StatelessWidget {
  final Widget child;

  const AppContent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        left: BorderSide(
          color: Color.fromRGBO(8, 49, 217, 1),
          width: 3,
        ),
        right: BorderSide(
          color: Color.fromRGBO(8, 49, 217, 1),
          width: 3,
        ),
        bottom: BorderSide(
          color: Color.fromRGBO(8, 49, 217, 1),
          width: 3,
        ),
      )),
      child: child,
    );
  }
}
