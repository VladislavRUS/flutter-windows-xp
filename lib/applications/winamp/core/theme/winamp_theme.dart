import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

final winampTheme = WinampTheme(
  playlistTheme: WinampPlaylistTheme(
    tracksBackground: Colors.black,
    trackText: const Color.fromRGBO(0, 255, 0, 1),
    trackBackgroundSelected: const Color.fromRGBO(0, 0, 198, 1),
    trackTextPlaying: Colors.white,
  ),
);

class WinampTheme {
  final WinampPlaylistTheme playlistTheme;

  WinampTheme({
    required this.playlistTheme,
  });

  static WinampTheme of(BuildContext context) => context.read<WinampTheme>();
}

class WinampPlaylistTheme {
  final Color tracksBackground;
  final Color trackText;
  final Color trackBackgroundSelected;
  final Color trackTextPlaying;

  WinampPlaylistTheme({
    required this.tracksBackground,
    required this.trackText,
    required this.trackBackgroundSelected,
    required this.trackTextPlaying,
  });
}
