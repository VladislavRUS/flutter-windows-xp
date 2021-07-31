import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/common/constants.dart';
import 'package:flutter_windows_xp/components/startup_bar/startup_menu_dialog/user_header.dart';

class StartupMenuDialog extends StatelessWidget {
  const StartupMenuDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 384,
          child: Column(
            children: const [UserHeader()],
          ),
        ),
        const SizedBox(
          height: Constants.bottomBarHeight,
        )
      ],
    );
  }
}
