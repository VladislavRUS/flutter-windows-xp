import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/audio_action_button/audio_action_button.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class NextActionButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 18,
      child: AudioActionButton(
        background: Assets.applications.winamp.ui.audio.actions.next.path,
        pressedBackground:
            Assets.applications.winamp.ui.audio.actions.nextPressed.path,
        onTap: onTap,
      ),
    );
  }
}
