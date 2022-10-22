import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/window/app_window/app_header/app_header_background.dart';

class AppHeader extends StatelessWidget {
  final Widget header;
  final bool focused;

  const AppHeader({
    Key? key,
    required this.header,
    required this.focused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Stack(
        children: [
          AppHeaderBackground(
            focused: focused,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              header,
            ],
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 3,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [
                  0,
                  1,
                ],
                colors: [
                  Color.fromRGBO(22, 56, 230, 0.4),
                  Colors.transparent,
                ],
              )),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 3,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [
                  0,
                  1,
                ],
                colors: [
                  Color.fromRGBO(22, 56, 230, 0.4),
                  Colors.transparent,
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
