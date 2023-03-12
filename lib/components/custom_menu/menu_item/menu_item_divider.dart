import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/common/windows_theme.dart';

class MenuItemDivider extends StatelessWidget {
  const MenuItemDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final windowsTheme = WindowsTheme.of(context);

    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: windowsTheme.menuDivider,
    );
  }
}
