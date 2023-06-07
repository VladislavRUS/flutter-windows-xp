import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/bloc/audio_actions_bloc.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/eject_action_button/eject_action_button.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/next_action_button/next_action_button.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/pause_action_button/pause_action_button.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/play_action_button/play_action_button.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/previous_action_button/previous_action_button.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/repeat_action_button/repeat_action_button.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/shuffle_action_button/shuffle_action_button.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_audio/audio_actions/stop_action_button/stop_action_button.dart';
import 'package:flutter_windows_xp/core/ioc/ioc.dart';
import 'package:flutter_windows_xp/core/utils/open_link.dart';
import 'bloc/audio_actions_state.dart';

class AudioActions extends StatefulWidget {
  const AudioActions({Key? key}) : super(key: key);

  @override
  State<AudioActions> createState() => _AudioActionsState();
}

class _AudioActionsState extends State<AudioActions> {
  late AudioActionsBloc _audioActionsBloc;

  @override
  void initState() {
    super.initState();

    _audioActionsBloc = locator<AudioActionsBloc>();
  }

  @override
  void dispose() {
    _audioActionsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _audioActionsBloc,
      child: BlocBuilder<AudioActionsBloc, AudioActionsState>(
        builder: (context, state) {
          final audioActionsBloc = context.read<AudioActionsBloc>();

          return Row(
            children: [
              PreviousActionButton(
                onTap: audioActionsBloc.previousTrack,
              ),
              PlayActionButton(
                onTap: audioActionsBloc.resumeTrack,
              ),
              PauseActionButton(
                onTap: audioActionsBloc.pauseTrack,
              ),
              StopActionButton(
                onTap: audioActionsBloc.stopTrack,
              ),
              NextActionButton(
                onTap: audioActionsBloc.nextTrack,
              ),
              const SizedBox(
                width: 8,
              ),
              EjectActionButton(
                onTap: audioActionsBloc.loadTracks,
              ),
              const SizedBox(
                width: 8,
              ),
              ShuffleActionButton(
                selected: false,
                onTap: () {},
              ),
              RepeatActionButton(
                selected: false,
                onTap: () {},
              ),
              const Spacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    openLink('https://www.winamp.com/');
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
