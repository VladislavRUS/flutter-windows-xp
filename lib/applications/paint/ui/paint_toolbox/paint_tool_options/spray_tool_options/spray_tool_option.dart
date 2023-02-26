import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SprayToolOption extends StatelessWidget {
  final double size;
  final bool active;

  const SprayToolOption({
    Key? key,
    required this.size,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SprayToolOptionPainter(
        active: active,
        radius: size / 2,
      ),
    );
  }
}

class _SprayToolOptionPainter extends CustomPainter {
  final bool active;
  final double radius;

  _SprayToolOptionPainter({
    required this.active,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final points = <Offset>[];

    final paint = Paint()
      ..color = active ? Colors.white : Colors.black
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    // Center of circle is canvas center
    final center = Offset(size.width / 2, size.height / 2);

    // Fill random points inside circle
    final random = Random(radius.toInt());

    for (var i = 0; i < 20 * radius; i++) {
      final angle = random.nextDouble() * 2 * pi;
      final distance = random.nextDouble() * radius;

      final x = center.dx + distance * cos(angle);

      final y = center.dy + distance * sin(angle);

      points.add(Offset(x, y));
    }

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant _SprayToolOptionPainter oldDelegate) =>
      oldDelegate.active != active;
}
