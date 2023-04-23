import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'package:flutter_windows_xp/ui/widgets/regular_window/regular_window_header/header_action_buttons/base_action_button.dart';

class ToggleSizeButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool maximized;
  final bool disabled;

  const ToggleSizeButton({
    Key? key,
    required this.onTap,
    required this.maximized,
    required this.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = WindowsTheme.of(context).regularWindowTheme;

    return BaseActionButton(
      onTap: onTap,
      disabled: disabled,
      child: Container(
        decoration: BoxDecoration(
          gradient: theme.toggleSizeButtonGradient,
        ),
        child: Center(
          child: maximized ? _buildMinimizeIcon() : _buildMaximizeIcon(),
        ),
      ),
    );
  }

  Widget _buildMinimizeIcon() {
    return Stack(
      children: [
        Positioned(
          left: 7,
          top: 4,
          child: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.white, width: 1),
                bottom: BorderSide(color: Colors.white, width: 1),
                right: BorderSide(color: Colors.white, width: 1),
                top: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
        ),
        Positioned(
          left: 4,
          top: 7,
          child: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(19, 109, 255, 1),
              border: Border(
                left: BorderSide(color: Colors.white, width: 1),
                bottom: BorderSide(color: Colors.white, width: 1),
                right: BorderSide(color: Colors.white, width: 1),
                top: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMaximizeIcon() {
    return Container(
      height: 12,
      width: 12,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.white, width: 1),
          bottom: BorderSide(color: Colors.white, width: 1),
          right: BorderSide(color: Colors.white, width: 1),
          top: BorderSide(color: Colors.white, width: 3),
        ),
      ),
    );
  }
}
