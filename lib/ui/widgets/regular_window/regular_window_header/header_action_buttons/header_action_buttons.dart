import 'package:flutter/material.dart' hide CloseButton;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_windows_xp/ui/widgets/window/bloc/window_bloc.dart';
import 'exit_button.dart';
import 'hide_button.dart';
import 'toggle_size_button.dart';

class HeaderActionButtons extends StatelessWidget {
  final bool maximizeDisabled;

  const HeaderActionButtons({
    Key? key,
    required this.maximizeDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final windowBloc = context.watch<WindowBloc>();
    final maximized = windowBloc.state.window?.maximized ?? false;

    return Row(
      children: [
        HideButton(
          onTap: windowBloc.hide,
        ),
        const SizedBox(
          width: 1,
        ),
        ToggleSizeButton(
          onTap: windowBloc.toggleSize,
          maximized: maximized,
          disabled: maximizeDisabled,
        ),
        const SizedBox(
          width: 1,
        ),
        ExitButton(
          onTap: windowBloc.exit,
        ),
      ],
    );
  }
}
