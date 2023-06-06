import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/applications/winamp/core/theme/winamp_theme.dart';
import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp_playlist/tracks_list/tracks_scrollbar/tracks_scrollbar.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'track_item/track_item.dart';

class TracksList extends StatefulWidget {
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
  State<TracksList> createState() => _TracksListState();
}

class _TracksListState extends State<TracksList> {
  double _scrolled = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _scrolled =
          _scrollController.offset / _scrollController.position.maxScrollExtent;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _onScrollbarDragUpdate(double value) {
    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent * value,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = WinampTheme.of(context).playlistTheme;

    return Stack(
      children: [
        SizedBox(
          height: 58,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                Assets.applications.winamp.ui.playlist.playlistTracksLeft.path,
                width: 12,
                repeat: ImageRepeat.repeatY,
              ),
              Expanded(
                child: Container(
                  color: theme.tracksBackground,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final track = widget.tracks[index];

                      return TrackItem(
                        index: index,
                        track: track,
                        isPlaying: track.id == widget.playing?.id,
                        isSelected: track.id == widget.selected?.id,
                        onTap: widget.onTrackTap,
                        onDoubleTap: widget.onTrackDoubleTap,
                      );
                    },
                    itemCount: widget.tracks.length,
                  ),
                ),
              ),
              Image.asset(
                Assets.applications.winamp.ui.playlist.playlistTracksRight.path,
                width: 20,
                repeat: ImageRepeat.repeatY,
              ),
            ],
          ),
        ),
        if (_scrollController.hasClients)
          Positioned(
            child: TracksScrollbar(
              percentageScrolled: _scrolled,
              onPercentageScrolled: _onScrollbarDragUpdate,
            ),
            right: 9,
            top: 3,
            bottom: 0,
            width: 8,
          ),
      ],
    );
  }
}
