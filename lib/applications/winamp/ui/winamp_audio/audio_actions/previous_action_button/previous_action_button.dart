import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/audio_action_button/audio_action_button.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class PreviousActionButton extends StatelessWidget {
  final VoidCallback onTap;

  const PreviousActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 23,
      height: 18,
      child: AudioActionButton(
        background: Assets.applications.winamp.ui.audio.actions.previous.path,
        pressedBackground:
            Assets.applications.winamp.ui.audio.actions.previousPressed.path,
        onTap: onTap,
      ),
    );
  }
}
