import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'package:flutter_windows_xp/ui/widgets/regular_window/regular_window_header/header_action_buttons/base_action_button.dart';

class ExitButton extends StatelessWidget {
  final VoidCallback onTap;

  const ExitButton({
    Key? key,
    required this.onTap,
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
              Color.fromRGBO(204, 70, 0, 1),
              Color.fromRGBO(220, 101, 39, 1),
              Color.fromRGBO(205, 117, 70, 1),
              Color.fromRGBO(255, 204, 178, 1),
              Color.fromRGBO(255, 255, 255, 1)
            ],
            stops: [0, 0.55, 0.7, 0.9, 1],
          ),
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
