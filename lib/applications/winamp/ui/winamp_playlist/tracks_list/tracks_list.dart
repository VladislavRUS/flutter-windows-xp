import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'track_item/track_item.dart';

class TracksList extends StatelessWidget {
  final List<TrackModel> tracks;
  final TrackModel? selected;
  final TrackModel? playing;
  final void Function(TrackModel) onTrackTap;
  final void Function(TrackModel) onTrackDoubleTap;

  const TracksList({
    Key? key,
    required this.tracks,
    required this.selected,
    required this.playing,
    required this.onTrackTap,
    required this.onTrackDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 4),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final track = tracks[index];

        return TrackItem(
          index: index,
          track: track,
          isPlaying: track.id == playing?.id,
          isSelected: track.id == selected?.id,
          onTap: onTrackTap,
          onDoubleTap: onTrackDoubleTap,
        );
      },
      itemCount: tracks.length,
    );
  }
}
