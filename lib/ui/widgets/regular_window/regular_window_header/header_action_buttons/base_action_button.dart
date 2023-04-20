import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/ui/widgets/hovered/hovered.dart';

class BaseActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const BaseActionButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hovered(
      builder: (_, hovered) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: 21,
            height: 21,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(3),
            ),
            child: ClipRRect(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  hovered ? Colors.white.withOpacity(0.15) : Colors.transparent,
                  BlendMode.lighten,
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
