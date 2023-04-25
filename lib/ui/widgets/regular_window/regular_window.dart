import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'package:flutter_windows_xp/ui/widgets/regular_window/regular_window_header/regular_window_header.dart';
import 'package:flutter_windows_xp/ui/widgets/window_builder/window_builder.dart';

class RegularWindow extends StatelessWidget {
  final Widget child;

  const RegularWindow({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = WindowsTheme.of(context).regularWindowTheme;

    return WindowBuilder(
      headerBuilder: (context, window) {
        return RegularWindowHeader(
          name: window.name,
          iconPath: window.application.icon,
          focused: window.focused,
          maximizeDisabled: !window.resizeDisabled,
        );
      },
      bodyBuilder: (context, window) {
        final borderColor =
            window.focused ? theme.focusedBorderColor : theme.borderColor;

        return Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: borderColor,
                width: 3,
              ),
              right: BorderSide(
                color: borderColor,
                width: 3,
              ),
              bottom: BorderSide(
                color: borderColor,
                width: 3,
              ),
            ),
          ),
          child: child,
        );
      },
    );
  }
}
