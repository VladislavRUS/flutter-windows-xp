import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/common/windows_theme.dart';
import 'package:flutter_windows_xp/components/hovered/hovered.dart';

class MenuItemOptionCheckmarkText extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool checked;

  const MenuItemOptionCheckmarkText({
    Key? key,
    required this.checked,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final windowsTheme = WindowsTheme.of(context);

    return Hovered(
      builder: (_, hovered) => SizedBox(
        height: 18,
        child: MenuItemButton(
          onPressed: onTap,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            enableFeedback: false,
            backgroundColor: MaterialStatePropertyAll(
              hovered
                  ? windowsTheme.menuItemHoveredBackground
                  : windowsTheme.menuItemBackground,
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 16,
                child: Center(
                  child: checked
                      ? Icon(
                          Icons.check,
                          size: 11,
                          color: hovered
                              ? windowsTheme.menuItemHoveredText
                              : windowsTheme.menuItemText,
                        )
                      : null,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 11,
                  color: hovered
                      ? windowsTheme.menuItemHoveredText
                      : windowsTheme.menuItemText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
