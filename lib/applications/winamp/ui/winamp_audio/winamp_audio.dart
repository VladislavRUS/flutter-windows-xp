import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/audio_actions.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class WinampAudio extends StatelessWidget {
  const WinampAudio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.applications.winamp.ui.audio.audio.path,
          ),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 10, bottom: 8),
            child: AudioActions(),
          ),
        ],
      ),
    );
  }
}
