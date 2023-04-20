import 'package:flutter/material.dart';

import 'package:conditional_wrap/conditional_wrap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_windows_xp/core/ioc/ioc.dart';
import 'package:flutter_windows_xp/data/models/models.dart';
import 'bloc/window_bloc.dart';

class Window extends StatefulWidget {
  final WindowModel window;

  const Window({
    Key? key,
    required this.window,
  }) : super(key: key);

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  late WindowBloc _windowBloc;

  @override
  void initState() {
    super.initState();

    _windowBloc = locator<WindowBloc>()..init(widget.window);
  }

  @override
  void didUpdateWidget(covariant Window oldWidget) {
    super.didUpdateWidget(oldWidget);

    _windowBloc.init(widget.window);
  }

  @override
  void dispose() {
    _windowBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _windowBloc,
      child: WidgetWrapper(
        wrapper: (child) {
          if (widget.window.maximized) {
            return Positioned.fill(child: child);
          }

          return Positioned(
            left: widget.window.x,
            top: widget.window.y,
            width: widget.window.width,
            height: widget.window.height,
            child: widget.window.application.builder(context),
          );
        },
        child: widget.window.application.builder(context),
      ),
    );
  }
}
