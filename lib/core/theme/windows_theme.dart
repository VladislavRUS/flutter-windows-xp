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
    userHeaderGradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(24, 104, 206, 1),
        Color.fromRGBO(14, 96, 203, 1),
        Color.fromRGBO(14, 96, 203, 1),
        Color.fromRGBO(17, 100, 207, 1),
        Color.fromRGBO(22, 103, 207, 1),
        Color.fromRGBO(27, 108, 211, 1),
        Color.fromRGBO(30, 112, 217, 1),
        Color.fromRGBO(36, 118, 220, 1),
        Color.fromRGBO(41, 122, 224, 1),
        Color.fromRGBO(52, 130, 227, 1),
        Color.fromRGBO(55, 134, 229, 1),
        Color.fromRGBO(66, 142, 233, 1),
        Color.fromRGBO(71, 145, 235, 1),
      ],
      stops: [
        0,
        0.12,
        0.2,
        0.32,
        0.33,
        0.47,
        0.54,
        0.6,
        0.65,
        0.77,
        0.79,
        0.9,
        1,
      ],
    ),
    userHeaderBorder: Colors.white,
    userHeaderName: Colors.white,
    userHeaderBackgroundGradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.transparent,
        Color.fromRGBO(255, 255, 255, 0.3),
        Color.fromRGBO(255, 255, 255, 0.5),
        Color.fromRGBO(255, 255, 255, 0.5),
        Color.fromRGBO(255, 255, 255, 0.3),
        Color.fromRGBO(255, 255, 255, 0.2),
        Colors.transparent
      ],
      stops: [0, 0.01, 0.02, 0.95, 0.98, 0.99, 1],
    ),
    startupToolbarBorder: const Color.fromRGBO(16, 66, 175, 1),
    startupToolbarGradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(12, 89, 185, 1),
        Color.fromRGBO(19, 158, 233, 1),
        Color.fromRGBO(24, 181, 242, 1),
        Color.fromRGBO(19, 155, 235, 1),
        Color.fromRGBO(18, 144, 232, 1),
        Color.fromRGBO(13, 141, 234, 1),
        Color.fromRGBO(13, 159, 241, 1),
        Color.fromRGBO(15, 158, 237, 1),
        Color.fromRGBO(17, 155, 233, 1),
        Color.fromRGBO(19, 146, 226, 1),
        Color.fromRGBO(19, 126, 215, 1),
        Color.fromRGBO(9, 91, 201, 1)
      ],
      stops: [
        0.01,
        0.06,
        0.1,
        0.14,
        0.19,
        0.63,
        0.81,
        0.88,
        0.91,
        0.94,
        0.97,
        1
      ],
    ),
    startupToolbarTime: Colors.white,
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
    exitButtonGradient: const RadialGradient(
      center: Alignment(0.9, 0.9),
      radius: 1.4,
      colors: [
        Color.fromRGBO(204, 70, 0, 1),
        Color.fromRGBO(220, 101, 39, 1),
        Color.fromRGBO(205, 117, 70, 1),
        Color.fromRGBO(255, 204, 178, 1),
        Color.fromRGBO(255, 255, 255, 1)
      ],
      stops: [0, 0.55, 0.7, 0.9, 1],
    ),
    hideButtonGradient: const RadialGradient(
      center: Alignment(0.9, 0.9),
      radius: 1.4,
      colors: [
        Color.fromRGBO(0, 84, 233, 1),
        Color.fromRGBO(34, 99, 213, 1),
        Color.fromRGBO(68, 121, 228, 1),
        Color.fromRGBO(163, 187, 236, 1),
        Color.fromRGBO(255, 255, 255, 1)
      ],
      stops: [0, 0.55, 0.7, 0.9, 1],
    ),
    toggleSizeButtonGradient: const RadialGradient(
      center: Alignment(0.9, 0.9),
      radius: 1.4,
      colors: [
        Color.fromRGBO(0, 84, 233, 1),
        Color.fromRGBO(34, 99, 213, 1),
        Color.fromRGBO(68, 121, 228, 1),
        Color.fromRGBO(163, 187, 236, 1),
        Color.fromRGBO(255, 255, 255, 1)
      ],
      stops: [0, 0.55, 0.7, 0.9, 1],
    ),
    headerActionButtonBorder: Colors.white,
  ),
  startApplicationIconTheme: StartApplicationIconTheme(
    selectedBackground: const Color.fromRGBO(11, 97, 255, 1),
    nameText: Colors.white,
    nameShadow: Colors.black,
  ),
);

class WindowsTheme {
  final StartupBarTheme startupBarTheme;
  final CustomMenuTheme customMenuTheme;
  final RegularWindowTheme regularWindowTheme;
  final StartApplicationIconTheme startApplicationIconTheme;

  WindowsTheme({
    required this.startupBarTheme,
    required this.customMenuTheme,
    required this.regularWindowTheme,
    required this.startApplicationIconTheme,
  });

  static WindowsTheme of(BuildContext context) {
    return context.read<WindowsTheme>();
  }
}

class StartApplicationIconTheme {
  final Color selectedBackground;
  final Color nameText;
  final Color nameShadow;

  StartApplicationIconTheme({
    required this.selectedBackground,
    required this.nameText,
    required this.nameShadow,
  });
}

class StartupBarTheme {
  final LinearGradient backgroundGradient;
  final Color menuBarrierColor;
  final LinearGradient userHeaderGradient;
  final Color userHeaderBorder;
  final Color userHeaderName;
  final LinearGradient userHeaderBackgroundGradient;
  final Color startupToolbarBorder;
  final LinearGradient startupToolbarGradient;
  final Color startupToolbarTime;

  StartupBarTheme({
    required this.backgroundGradient,
    required this.menuBarrierColor,
    required this.userHeaderGradient,
    required this.userHeaderBorder,
    required this.userHeaderName,
    required this.userHeaderBackgroundGradient,
    required this.startupToolbarBorder,
    required this.startupToolbarGradient,
    required this.startupToolbarTime,
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
  final RadialGradient exitButtonGradient;
  final RadialGradient hideButtonGradient;
  final RadialGradient toggleSizeButtonGradient;
  final Color headerActionButtonBorder;

  RegularWindowTheme({
    required this.borderColor,
    required this.focusedBorderColor,
    required this.exitButtonGradient,
    required this.hideButtonGradient,
    required this.toggleSizeButtonGradient,
    required this.headerActionButtonBorder,
  });
}
