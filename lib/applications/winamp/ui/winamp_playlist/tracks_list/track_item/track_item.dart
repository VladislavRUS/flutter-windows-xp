import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/core/theme/winamp_theme.dart';
import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';

class TrackItem extends StatelessWidget {
  final int index;
  final TrackModel track;
  final bool isSelected;
  final bool isPlaying;
  final void Function(TrackModel) onTap;
  final void Function(TrackModel) onDoubleTap;

  const TrackItem({
    Key? key,
    required this.index,
    required this.track,
    required this.isSelected,
    required this.isPlaying,
    required this.onTap,
    required this.onDoubleTap,
  }) : super(key: key);

  TextStyle _getTextStyle(BuildContext context) {
    final theme = WinampTheme.of(context).playlistTheme;

    final color = isPlaying ? theme.trackTextPlaying : theme.trackText;

    return TextStyle(
      fontSize: 9,
      color: color,
    );
  }

  void _onTap() {
    onTap(track);
  }

  void _onDoubleTap() {
    onDoubleTap(track);
  }

  @override
  Widget build(BuildContext context) {
    final theme = WinampTheme.of(context).playlistTheme;

    final textStyle = _getTextStyle(context);

    final duration = Duration(seconds: track.durationInSeconds);
    final durationString =
        '${duration.inMinutes}:${duration.inSeconds.remainder(60).toString().padRight(2, '0')}';

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        color: isSelected ? theme.trackBackgroundSelected : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${index + 1}',
              style: textStyle,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                track.name,
                style: textStyle,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              durationString,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
