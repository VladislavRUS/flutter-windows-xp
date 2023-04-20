import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'toolbar_icons.dart';
import 'toolbar_time.dart';

class StartupToolbar extends StatelessWidget {
  const StartupToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = WindowsTheme.of(context).startupBarTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: theme.startupToolbarBorder, width: 1),
        ),
        gradient: theme.startupToolbarGradient,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ToolbarIcons(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: const ToolbarTime(),
          ),
        ],
      ),
    );
  }
}
