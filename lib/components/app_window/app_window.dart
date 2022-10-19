import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/app_window/app_header/app_header.dart';

class AppWindow extends StatelessWidget {
  final Widget child;

  const AppWindow({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(8, 49, 217, 1)),
      ),
      child: Column(
        children: [
          const AppHeader(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
