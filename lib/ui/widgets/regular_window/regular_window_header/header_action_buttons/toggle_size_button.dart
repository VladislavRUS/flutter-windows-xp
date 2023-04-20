import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/ui/widgets/regular_window/regular_window_header/header_action_buttons/base_action_button.dart';

class ToggleSizeButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool maximized;

  const ToggleSizeButton({
    Key? key,
    required this.onTap,
    required this.maximized,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseActionButton(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
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
