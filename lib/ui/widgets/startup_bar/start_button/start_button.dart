import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import '../startup_menu_dialog/startup_menu_dialog.dart';

class StartButton extends StatefulWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  bool _hovered = false;
  bool _pressed = false;

  Color get filterColor {
    if (_pressed) {
      return Colors.black.withOpacity(0.05);
    }

    if (_hovered) {
      return Colors.white.withOpacity(0.05);
    }

    return Colors.transparent;
  }

  void _onEnter(PointerEnterEvent _) {
    setState(() {
      _hovered = true;
    });
  }

  void _onExit(PointerExitEvent _) {
    setState(() {
      _hovered = false;
    });
  }

  void _onTapDown(TapDownDetails _) {
    setState(() {
      _pressed = true;
    });
  }

  void _onTapUp(TapUpDetails _) {
    setState(() {
      _pressed = false;
    });
  }

  void _onTap() async {
    final startupTheme = WindowsTheme.of(context).startupBarTheme;

    await showDialog<void>(
      context: context,
      builder: (_) => const StartupMenuDialog(),
      barrierColor: startupTheme.menuBarrierColor,
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTap: _onTap,
        child: ClipRRect(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(filterColor, BlendMode.lighten),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.startButton.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
