import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/ui/screens/app/desktop_renderer/bloc/desktop_renderer_bloc.dart';

class ApplicationIcon extends StatefulWidget {
  final ApplicationModel application;

  const ApplicationIcon({
    Key? key,
    required this.application,
  }) : super(key: key);

  @override
  State<ApplicationIcon> createState() => _ApplicationIconState();
}

class _ApplicationIconState extends State<ApplicationIcon> {
  bool _selected = false;

  Color? get _backgroundColor =>
      _selected ? const Color.fromRGBO(11, 97, 255, 1) : null;

  void _onTappedInside() {
    setState(() {
      _selected = true;
    });
  }

  void _onTappedOutside() {
    setState(() {
      _selected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final desktopBloc = context.read<DesktopRendererBloc>();

    return TapOutsideDetectorWidget(
      onTappedInside: _onTappedInside,
      onTappedOutside: _onTappedOutside,
      child: GestureDetector(
        onDoubleTap: () {
          desktopBloc.onStartApplication(widget.application);
        },
        child: Column(
          children: [
            Image.asset(
              widget.application.icon,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
              color: _backgroundColor,
              colorBlendMode: BlendMode.softLight,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: _backgroundColor,
              padding: const EdgeInsets.all(2),
              child: Text(
                widget.application.name,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}