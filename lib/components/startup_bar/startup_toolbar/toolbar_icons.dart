import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/common/assets.dart';

class ToolbarIcons extends StatelessWidget {
  const ToolbarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.sound,
          width: 15,
          height: 15,
        ),
        const SizedBox(
          width: 2,
        ),
        Image.asset(
          Assets.deviceIcon,
          width: 15,
          height: 15,
        ),
        const SizedBox(
          width: 2,
        ),
        Image.asset(
          Assets.protection,
          width: 15,
          height: 15,
        )
      ],
    );
  }
}
