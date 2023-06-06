import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/ui/widgets/pressed/pressed.dart';

class AudioActionButton extends StatelessWidget {
  final String background;
  final String pressedBackground;
  final VoidCallback onTap;

  const AudioActionButton({
    Key? key,
    required this.background,
    required this.pressedBackground,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pressed(
      onPress: onTap,
      builder: (context, pressed) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(pressed ? pressedBackground : background),
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
            ),
          ),
        );
      },
    );
  }
}
