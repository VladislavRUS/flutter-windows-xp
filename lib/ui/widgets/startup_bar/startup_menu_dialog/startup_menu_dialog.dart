import 'package:flutter/material.dart';

import 'user_header.dart';

class StartupMenuDialog extends StatelessWidget {
  const StartupMenuDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 384,
          child: Column(
            children: [
              UserHeader(),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
