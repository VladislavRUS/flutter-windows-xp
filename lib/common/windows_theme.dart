import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

final windowsTheme = WindowsTheme(
  menuBackground: const Color.fromRGBO(236, 233, 216, 1),
  menuBorder: const Color.fromRGBO(128, 128, 128, 1),
  menuBarButtonBackground: Colors.transparent,
  menuBarButtonHoveredBackground: const Color.fromRGBO(22, 96, 232, 1),
  menuItemHoveredBackground: const Color.fromRGBO(0, 94, 201, 1),
  menuItemHoveredText: const Color.fromRGBO(255, 255, 255, 1),
  menuItemBackground: Colors.transparent,
  menuItemText: const Color.fromRGBO(0, 0, 0, 1),
  menuDivider: const Color.fromRGBO(0, 0, 0, 0.2),
);

class WindowsTheme {
  final Color menuBackground;
  final Color menuBorder;
  final Color menuBarButtonBackground;
  final Color menuBarButtonHoveredBackground;
  final Color menuItemHoveredBackground;
  final Color menuItemHoveredText;
  final Color menuItemBackground;
  final Color menuItemText;
  final Color menuDivider;

  static WindowsTheme of(BuildContext context) {
    return context.read<WindowsTheme>();
  }

  WindowsTheme({
    required this.menuBackground,
    required this.menuBorder,
    required this.menuBarButtonBackground,
    required this.menuBarButtonHoveredBackground,
    required this.menuItemHoveredBackground,
    required this.menuItemHoveredText,
    required this.menuItemBackground,
    required this.menuItemText,
    required this.menuDivider,
  });
}
