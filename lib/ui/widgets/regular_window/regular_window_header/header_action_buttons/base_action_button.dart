import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'package:flutter_windows_xp/ui/widgets/hovered/hovered.dart';

class BaseActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const BaseActionButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = WindowsTheme.of(context).regularWindowTheme;

    return Hovered(
      builder: (_, hovered) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: 21,
            height: 21,
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.headerActionButtonBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: ClipRRect(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hovered
                      ? theme.headerActionButtonBorder.withOpacity(0.15)
                      : Colors.transparent,
                  BlendMode.lighten,
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
