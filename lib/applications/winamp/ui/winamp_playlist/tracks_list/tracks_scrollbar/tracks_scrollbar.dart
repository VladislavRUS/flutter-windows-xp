import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class TracksScrollbar extends StatefulWidget {
  final double percentageScrolled;
  final ValueChanged<double> onPercentageScrolled;

  const TracksScrollbar({
    Key? key,
    required this.percentageScrolled,
    required this.onPercentageScrolled,
  }) : super(key: key);

  @override
  State<TracksScrollbar> createState() => _TracksScrollbarState();
}

class _TracksScrollbarState extends State<TracksScrollbar> {
  final _scrollbarHeight = 18.0;
  double _scrolledPercents = 0;
  bool _dragging = false;

  void _onPanUpdate(DragUpdateDetails details, BoxConstraints constraints) {
    final maxHeight = constraints.maxHeight - _scrollbarHeight;

    final currentTop = _scrolledPercents * maxHeight;

    double nextTop = currentTop + details.delta.dy;

    if (nextTop < 0) {
      nextTop = 0;
    } else if (nextTop > maxHeight) {
      nextTop = maxHeight;
    }

    final scrolledPercents = nextTop / maxHeight;

    setState(() {
      _scrolledPercents = scrolledPercents;
    });

    widget.onPercentageScrolled(scrolledPercents);
  }

  @override
  void didUpdateWidget(covariant TracksScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_dragging) {
      return;
    }

    if (widget.percentageScrolled != oldWidget.percentageScrolled) {
      setState(() {
        _scrolledPercents = widget.percentageScrolled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return GestureDetector(
          onPanStart: (_) => setState(() => _dragging = true),
          onPanEnd: (_) => setState(() => _dragging = false),
          onPanUpdate: (details) => _onPanUpdate(details, constraints),
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: 8,
                height: double.infinity,
              ),
              Positioned(
                top: _scrolledPercents *
                    (constraints.maxHeight - _scrollbarHeight),
                child: Image.asset(
                  Assets.applications.winamp.ui.playlist.playlistScrollbarHandle
                      .path,
                  height: _scrollbarHeight,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
