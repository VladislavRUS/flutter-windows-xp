import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

final windowsTheme = WindowsTheme(
  startupBarTheme: StartupBarTheme(
    backgroundGradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(31, 47, 134, 1),
        Color.fromRGBO(49, 101, 196, 1),
        Color.fromRGBO(54, 130, 229, 1),
        Color.fromRGBO(68, 144, 230, 1),
        Color.fromRGBO(56, 131, 229, 1),
        Color.fromRGBO(43, 113, 224, 1),
        Color.fromRGBO(38, 99, 218, 1),
        Color.fromRGBO(35, 91, 214, 1),
        Color.fromRGBO(34, 88, 213, 1),
        Color.fromRGBO(33, 87, 214, 1),
        Color.fromRGBO(36, 93, 219, 1),
        Color.fromRGBO(37, 98, 223, 1),
        Color.fromRGBO(36, 95, 220, 1),
        Color.fromRGBO(33, 88, 212, 1),
        Color.fromRGBO(29, 78, 192, 1),
        Color.fromRGBO(25, 65, 165, 1),
      ],
      stops: [
        0,
        0.03,
        0.06,
        0.1,
        0.12,
        0.15,
        0.18,
        0.2,
        0.23,
        0.38,
        0.54,
        0.86,
        0.89,
        0.92,
        0.95,
        0.98,
      ],
    ),
    menuBarrierColor: Colors.transparent,
  ),
  customMenuTheme: CustomMenuTheme(
    menuBackground: const Color.fromRGBO(236, 233, 216, 1),
    menuBorder: const Color.fromRGBO(128, 128, 128, 1),
    menuBarButtonBackground: Colors.transparent,
    menuBarButtonHoveredBackground: const Color.fromRGBO(22, 96, 232, 1),
    menuItemHoveredBackground: const Color.fromRGBO(0, 94, 201, 1),
    menuItemHoveredText: const Color.fromRGBO(255, 255, 255, 1),
    menuItemBackground: Colors.transparent,
    menuItemText: const Color.fromRGBO(0, 0, 0, 1),
    menuDivider: const Color.fromRGBO(0, 0, 0, 0.2),
  ),
  regularWindowTheme: RegularWindowTheme(
    borderColor: const Color.fromRGBO(101, 130, 245, 1),
    focusedBorderColor: const Color.fromRGBO(8, 49, 217, 1),
  ),
);

class WindowsTheme {
  final StartupBarTheme startupBarTheme;
  final CustomMenuTheme customMenuTheme;
  final RegularWindowTheme regularWindowTheme;

  WindowsTheme({
    required this.startupBarTheme,
    required this.customMenuTheme,
    required this.regularWindowTheme,
  });

  static WindowsTheme of(BuildContext context) {
    return context.read<WindowsTheme>();
  }
}

class StartupBarTheme {
  final LinearGradient backgroundGradient;
  final Color menuBarrierColor;

  StartupBarTheme({
    required this.backgroundGradient,
    required this.menuBarrierColor,
  });
}

class CustomMenuTheme {
  final Color menuBackground;
  final Color menuBorder;
  final Color menuBarButtonBackground;
  final Color menuBarButtonHoveredBackground;
  final Color menuItemHoveredBackground;
  final Color menuItemHoveredText;
  final Color menuItemBackground;
  final Color menuItemText;
  final Color menuDivider;

  CustomMenuTheme({
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

class RegularWindowTheme {
  final Color borderColor;
  final Color focusedBorderColor;

  RegularWindowTheme({
    required this.borderColor,
    required this.focusedBorderColor,
  });
}
