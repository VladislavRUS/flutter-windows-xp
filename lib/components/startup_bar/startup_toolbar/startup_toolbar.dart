import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/startup_bar/startup_toolbar/toolbar_icons.dart';

import 'toolbar_time.dart';

class StartupToolbar extends StatelessWidget {
  const StartupToolbar({Key? key}) : super(key: key);

  BoxDecoration get _decoration {
    return const BoxDecoration(
      border: Border(
        left: BorderSide(color: Color.fromRGBO(16, 66, 175, 1), width: 1),
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(12, 89, 185, 1),
          Color.fromRGBO(19, 158, 233, 1),
          Color.fromRGBO(24, 181, 242, 1),
          Color.fromRGBO(19, 155, 235, 1),
          Color.fromRGBO(18, 144, 232, 1),
          Color.fromRGBO(13, 141, 234, 1),
          Color.fromRGBO(13, 159, 241, 1),
          Color.fromRGBO(15, 158, 237, 1),
          Color.fromRGBO(17, 155, 233, 1),
          Color.fromRGBO(19, 146, 226, 1),
          Color.fromRGBO(19, 126, 215, 1),
          Color.fromRGBO(9, 91, 201, 1)
        ],
        stops: [
          0.01,
          0.06,
          0.1,
          0.14,
          0.19,
          0.63,
          0.81,
          0.88,
          0.91,
          0.94,
          0.97,
          1
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: _decoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ToolbarIcons(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: const ToolbarTime(),
          ),
        ],
      ),
    );
  }
}
