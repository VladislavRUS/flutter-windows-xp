import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/winamp/core/theme/winamp_theme.dart';
import '../../../ui/widgets/window/bloc/window_bloc.dart';
import 'winamp_audio/winamp_audio.dart';
import 'winamp_playlist/winamp_playlist.dart';
import 'winamp_window/winamp_window.dart';

class Winamp extends StatefulWidget {
  const Winamp({Key? key}) : super(key: key);

  @override
  State<Winamp> createState() => _WinampState();
}

class _WinampState extends State<Winamp> {
  @override
  void initState() {
    super.initState();

    context.read<WindowBloc>().setSize(
          width: 275,
          height: 285,
        );

    // TODO uncomment when ready
    // locator<PlayLamaTrackUseCase>().execute(PlayLamaTrackUseCaseParams());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: winampTheme),
      ],
      child: WinampWindow(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            WinampAudio(),
            WinampPlaylist(),
          ],
        ),
      ),
    );
  }
}
