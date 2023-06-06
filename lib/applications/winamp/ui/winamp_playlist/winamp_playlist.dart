import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_windows_xp/applications/winamp/ui/winamp_playlist/playlist_title/playlist_title.dart';
import 'package:flutter_windows_xp/core/ioc/ioc.dart';
import 'bloc/winamp_playlist_bloc.dart';
import 'bloc/winamp_playlist_state.dart';
import 'tracks_list/tracks_list.dart';

class WinampPlaylist extends StatelessWidget {
  const WinampPlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<WinampPlaylistBloc>()..getTracks(),
      child: BlocBuilder<WinampPlaylistBloc, WinampPlaylistState>(
        builder: (context, state) {
          final bloc = context.read<WinampPlaylistBloc>();

          return Column(
            children: [
              const PlaylistTitle(),
              TracksList(
                tracks: state.tracks,
                playing: state.playing,
                selected: state.selected,
                onTrackTap: bloc.selectTrack,
                onTrackDoubleTap: bloc.playTrack,
              ),
            ],
          );
        },
      ),
    );
  }
}
