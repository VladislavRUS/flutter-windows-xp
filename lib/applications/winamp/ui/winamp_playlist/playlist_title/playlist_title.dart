import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class PlaylistTitle extends StatelessWidget {
  const PlaylistTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Image.asset(
            Assets.applications.winamp.ui.playlist.playlistLeftCorner.path,
            width: 25,
          ),
          Expanded(
            child: Image.asset(
              Assets.applications.winamp.ui.playlist.playlistFill.path,
              fit: BoxFit.fill,
            ),
          ),
          Image.asset(
            Assets.applications.winamp.ui.playlist.playlistTitle.path,
            width: 100,
          ),
          Expanded(
            child: Image.asset(
              Assets.applications.winamp.ui.playlist.playlistFill.path,
              fit: BoxFit.fill,
            ),
          ),
          Image.asset(
            Assets.applications.winamp.ui.playlist.playlistRightCorner.path,
            width: 25,
          ),
        ],
      ),
    );
  }
}
