import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/audio_action_button/audio_action_button.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class ShuffleActionButton extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const ShuffleActionButton({
    Key? key,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 47,
      height: 15,
      child: AudioActionButton(
        background: selected
            ? Assets.applications.winamp.ui.audio.actions.shuffleSelected.path
            : Assets.applications.winamp.ui.audio.actions.shuffle.path,
        pressedBackground: selected
            ? Assets.applications.winamp.ui.audio.actions.shuffleSelectedPressed
                .path
            : Assets.applications.winamp.ui.audio.actions.shufflePressed.path,
        onTap: onTap,
      ),
    );
  }
}
