import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/audio_action_button/audio_action_button.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class EjectActionButton extends StatelessWidget {
  final VoidCallback onTap;

  const EjectActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 16,
      child: AudioActionButton(
        background: Assets.applications.winamp.ui.audio.actions.eject.path,
        pressedBackground:
            Assets.applications.winamp.ui.audio.actions.ejectPressed.path,
        onTap: onTap,
      ),
    );
  }
}
