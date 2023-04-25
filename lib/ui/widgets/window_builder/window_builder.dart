import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'package:flutter_windows_xp/core/enums/enums.dart';
import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/ui/widgets/draggable_handler/draggable_handler.dart';
import 'package:flutter_windows_xp/ui/widgets/resizable_window/resizable_window.dart';
import 'package:flutter_windows_xp/ui/widgets/window/bloc/window_bloc.dart';

class WindowBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, WindowModel window) headerBuilder;
  final Widget Function(BuildContext context, WindowModel window) bodyBuilder;

  const WindowBuilder({
    Key? key,
    required this.headerBuilder,
    required this.bodyBuilder,
  }) : super(key: key);

  @override
  State<WindowBuilder> createState() => _WindowBuilderState();
}

class _WindowBuilderState extends State<WindowBuilder> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<WindowBloc>();
    final window = bloc.state.window;

    if (!_visible || window == null) {
      return const SizedBox.shrink();
    }

    return TapOutsideDetectorWidget(
      onTappedOutside: bloc.unfocus,
      child: GestureDetector(
        onPanDown: window.focused ? null : (_) => bloc.focus(),
        child: ResizableWindow(
          disabled: window.resizeDisabled,
          onTopUpdate: (offset) => bloc.resize(
            offset,
            ResizeDirection.top,
          ),
          onRightUpdate: (offset) => bloc.resize(
            offset,
            ResizeDirection.right,
          ),
          onBottomUpdate: (offset) => bloc.resize(
            offset,
            ResizeDirection.bottom,
          ),
          onLeftUpdate: (offset) => bloc.resize(
            offset,
            ResizeDirection.left,
          ),
          onTopLeftUpdate: (offset) => bloc.resize(
            offset,
            ResizeDirection.topLeft,
          ),
          onTopRightUpdate: (offset) => bloc.resize(
            offset,
            ResizeDirection.topRight,
          ),
          onBottomRightUpdate: (offset) => bloc.resize(
            offset,
            ResizeDirection.bottomRight,
          ),
          onBottomLeftUpdate: (offset) => bloc.resize(
            offset,
            ResizeDirection.bottomLeft,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DraggableHandler(
                onUpdate: (offset) => bloc.drag(offset),
                child: widget.headerBuilder(context, window),
              ),
              Expanded(
                child: widget.bodyBuilder(context, window),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
