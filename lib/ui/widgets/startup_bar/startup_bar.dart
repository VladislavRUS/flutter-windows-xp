import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'start_button/start_button.dart';
import 'startup_toolbar/startup_toolbar.dart';

class StartupBar extends StatelessWidget {
  const StartupBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startupBarTheme = WindowsTheme.of(context).startupBarTheme;

    return Container(
      height: 30,
      decoration: BoxDecoration(
        gradient: startupBarTheme.backgroundGradient,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 106,
            child: StartButton(),
          ),
          StartupToolbar(),
        ],
      ),
    );
  }
}
