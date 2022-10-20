import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/app_window/app_window.dart';

class Notepad extends StatelessWidget {
  const Notepad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWindow(
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
