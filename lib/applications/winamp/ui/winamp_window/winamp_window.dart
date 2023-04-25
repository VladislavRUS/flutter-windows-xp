import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/ui/widgets/window_builder/window_builder.dart';
import '../../../../core/assets/assets.gen.dart';

class WinampWindow extends StatelessWidget {
  final Widget child;

  const WinampWindow({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowBuilder(
      headerBuilder: (context, window) {
        return Container(
          height: 14,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                window.focused
                    ? Assets.applications.winamp.ui.headerSelected.path
                    : Assets.applications.winamp.ui.header.path,
              ),
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      bodyBuilder: (context, window) {
        return child;
      },
    );
  }
}
