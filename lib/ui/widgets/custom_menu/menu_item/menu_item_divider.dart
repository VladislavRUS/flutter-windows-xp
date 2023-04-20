import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';

class MenuItemDivider extends StatelessWidget {
  const MenuItemDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customMenuTheme = WindowsTheme.of(context).customMenuTheme;

    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: customMenuTheme.menuDivider,
    );
  }
}
