import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'package:flutter_windows_xp/core/enums/enums.dart';
import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'package:flutter_windows_xp/ui/widgets/draggable_handler/draggable_handler.dart';
import 'package:flutter_windows_xp/ui/widgets/regular_window/regular_window_header/regular_window_header.dart';
import 'package:flutter_windows_xp/ui/widgets/resizable_window/resizable_window.dart';
import 'package:flutter_windows_xp/ui/widgets/window/bloc/window_bloc.dart';

class RegularWindow extends StatelessWidget {
  final Widget child;

  const RegularWindow({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<WindowBloc>();

    final isFocused = bloc.state.window?.focused ?? false;
    final isMaximized = bloc.state.window?.maximized ?? false;

    final theme = WindowsTheme.of(context).regularWindowTheme;

    final borderColor =
        isFocused ? theme.focusedBorderColor : theme.borderColor;

    return TapOutsideDetectorWidget(
      onTappedOutside: bloc.unfocus,
      child: GestureDetector(
        onPanDown: isFocused ? null : (_) => bloc.focus(),
        child: ResizableWindow(
          disabled: isMaximized,
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
                child: RegularWindowHeader(
                  name: bloc.state.window?.name,
                  iconPath: bloc.state.window?.application.icon,
                  focused: isFocused,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: borderColor,
                        width: 3,
                      ),
                      right: BorderSide(
                        color: borderColor,
                        width: 3,
                      ),
                      bottom: BorderSide(
                        color: borderColor,
                        width: 3,
                      ),
                    ),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
