import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_windows_xp/core/ioc/ioc.dart';
import 'package:flutter_windows_xp/ui/widgets/window/window.dart';
import 'bloc/windows_renderer_bloc.dart';
import 'bloc/windows_renderer_state.dart';

class WindowsRenderer extends StatelessWidget {
  const WindowsRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<WindowsRendererBloc>(),
      child: BlocBuilder<WindowsRendererBloc, WindowsRendererState>(
        builder: (context, state) {
          final windows = state.displayWindows;

          return Stack(
            children: windows
                .map(
                  (window) => Window(
                    key: Key(window.id),
                    window: window,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
