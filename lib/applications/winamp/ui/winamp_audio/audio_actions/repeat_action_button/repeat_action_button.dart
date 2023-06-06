import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/audio_action_button/audio_action_button.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class RepeatActionButton extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const RepeatActionButton({
    Key? key,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 15,
      child: AudioActionButton(
        background: selected
            ? Assets.applications.winamp.ui.audio.actions.repeatSelected.path
            : Assets.applications.winamp.ui.audio.actions.repeat.path,
        pressedBackground: selected
            ? Assets
                .applications.winamp.ui.audio.actions.repeatSelectedPressed.path
            : Assets.applications.winamp.ui.audio.actions.repeatPressed.path,
        onTap: onTap,
      ),
    );
  }
}
