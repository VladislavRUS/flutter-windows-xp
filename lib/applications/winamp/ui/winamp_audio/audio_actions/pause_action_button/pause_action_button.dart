import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/audio_action_button/audio_action_button.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class PauseActionButton extends StatelessWidget {
  final VoidCallback onTap;

  const PauseActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 23,
      height: 18,
      child: AudioActionButton(
        background: Assets.applications.winamp.ui.audio.actions.pause.path,
        pressedBackground:
            Assets.applications.winamp.ui.audio.actions.pausePressed.path,
        onTap: onTap,
      ),
    );
  }
}
