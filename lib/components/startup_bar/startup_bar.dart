import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/common/constants.dart';
import 'package:flutter_windows_xp/components/startup_bar/start_button/start_button.dart';
import 'package:flutter_windows_xp/components/startup_bar/startup_toolbar/startup_toolbar.dart';

class StartupBar extends StatelessWidget {
  const StartupBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.bottomBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(31, 47, 134, 1),
            Color.fromRGBO(49, 101, 196, 1),
            Color.fromRGBO(54, 130, 229, 1),
            Color.fromRGBO(68, 144, 230, 1),
            Color.fromRGBO(56, 131, 229, 1),
            Color.fromRGBO(43, 113, 224, 1),
            Color.fromRGBO(38, 99, 218, 1),
            Color.fromRGBO(35, 91, 214, 1),
            Color.fromRGBO(34, 88, 213, 1),
            Color.fromRGBO(33, 87, 214, 1),
            Color.fromRGBO(36, 93, 219, 1),
            Color.fromRGBO(37, 98, 223, 1),
            Color.fromRGBO(36, 95, 220, 1),
            Color.fromRGBO(33, 88, 212, 1),
            Color.fromRGBO(29, 78, 192, 1),
            Color.fromRGBO(25, 65, 165, 1),
          ],
          stops: [
            0,
            0.03,
            0.06,
            0.1,
            0.12,
            0.15,
            0.18,
            0.2,
            0.23,
            0.38,
            0.54,
            0.86,
            0.89,
            0.92,
            0.95,
            0.98,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(width: 106, child: StartButton()),
          StartupToolbar(),
        ],
      ),
    );
  }
}
