import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'base_action_button.dart';

class HideButton extends StatelessWidget {
  final VoidCallback onTap;

  const HideButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = WindowsTheme.of(context).regularWindowTheme;

    return BaseActionButton(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: theme.hideButtonGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 3, left: 4),
              height: 3,
              width: 8,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
