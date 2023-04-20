import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'package:flutter_windows_xp/ui/widgets/regular_window/regular_window_header/header_action_buttons/base_action_button.dart';

class ExitButton extends StatelessWidget {
  final VoidCallback onTap;

  const ExitButton({
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
          gradient: theme.exitButtonGradient,
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.icons.close,
            color: Colors.white,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
