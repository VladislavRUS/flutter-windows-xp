import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'package:flutter_windows_xp/ui/widgets/hovered/hovered.dart';

class BaseActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool disabled;

  const BaseActionButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = WindowsTheme.of(context).regularWindowTheme;

    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: IgnorePointer(
        ignoring: disabled,
        child: Hovered(
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
        ),
      ),
    );
  }
}
