import 'package:flutter/material.dart';

import 'base_action_button.dart';

class HideButton extends StatelessWidget {
  final VoidCallback onTap;

  const HideButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseActionButton(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.9, 0.9),
            radius: 1.4,
            colors: [
              Color.fromRGBO(0, 84, 233, 1),
              Color.fromRGBO(34, 99, 213, 1),
              Color.fromRGBO(68, 121, 228, 1),
              Color.fromRGBO(163, 187, 236, 1),
              Color.fromRGBO(255, 255, 255, 1)
            ],
            stops: [0, 0.55, 0.7, 0.9, 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 3, left: 4),
              height: 3,
              width: 8,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
