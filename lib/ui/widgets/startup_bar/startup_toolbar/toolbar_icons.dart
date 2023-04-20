import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class ToolbarIcons extends StatelessWidget {
  const ToolbarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.icons.sound.path,
          width: 15,
          height: 15,
        ),
        const SizedBox(
          width: 2,
        ),
        Image.asset(
          Assets.icons.device.path,
          width: 15,
          height: 15,
        ),
        const SizedBox(
          width: 2,
        ),
        Image.asset(
          Assets.icons.protection.path,
          width: 15,
          height: 15,
        )
      ],
    );
  }
}
