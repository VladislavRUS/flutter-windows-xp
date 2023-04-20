import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'package:flutter_windows_xp/core/theme/windows_theme.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = WindowsTheme.of(context).startupBarTheme;

    return Stack(
      children: [
        Container(
          height: 54,
          padding: const EdgeInsets.only(
            top: 6,
            right: 5,
            bottom: 5,
            left: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            gradient: theme.userHeaderGradient,
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.userHeaderBorder, width: 2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Image.asset(
                  Assets.images.userAvatar.path,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'User',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: theme.userHeaderName,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: theme.userHeaderBackgroundGradient,
            ),
          ),
        )
      ],
    );
  }
}
