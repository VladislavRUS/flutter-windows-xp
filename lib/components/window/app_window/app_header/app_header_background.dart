import 'package:flutter/material.dart';

class AppHeaderBackground extends StatelessWidget {
  final bool focused;

  const AppHeaderBackground({
    Key? key,
    required this.focused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return focused ? _buildFocused() : _buildNotFocused();
  }

  Widget _buildFocused() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0,
          0.04,
          0.06,
          0.08,
          0.1,
          0.14,
          0.2,
          0.24,
          0.56,
          0.66,
          0.76,
          0.86,
          0.92,
          0.94,
          1
        ],
        colors: [
          Color.fromRGBO(0, 88, 238, 1),
          Color.fromRGBO(53, 147, 255, 1),
          Color.fromRGBO(40, 142, 255, 1),
          Color.fromRGBO(18, 125, 255, 1),
          Color.fromRGBO(3, 111, 252, 1),
          Color.fromRGBO(2, 98, 238, 1),
          Color.fromRGBO(0, 87, 229, 1),
          Color.fromRGBO(0, 84, 227, 1),
          Color.fromRGBO(0, 85, 235, 1),
          Color.fromRGBO(0, 91, 245, 1),
          Color.fromRGBO(2, 106, 254, 1),
          Color.fromRGBO(0, 98, 239, 1),
          Color.fromRGBO(0, 82, 214, 1),
          Color.fromRGBO(0, 64, 171, 1),
          Color.fromRGBO(0, 48, 146, 1)
        ],
      )),
    );
  }

  Widget _buildNotFocused() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0,
          0.03,
          0.06,
          0.08,
          0.14,
          0.17,
          0.25,
          0.56,
          0.81,
          0.89,
          0.94,
          0.97,
          1
        ],
        colors: [
          Color.fromRGBO(118, 151, 231, 1),
          Color.fromRGBO(126, 158, 227, 1),
          Color.fromRGBO(148, 175, 232, 1),
          Color.fromRGBO(151, 180, 233, 1),
          Color.fromRGBO(130, 165, 228, 1),
          Color.fromRGBO(124, 159, 226, 1),
          Color.fromRGBO(121, 150, 222, 1),
          Color.fromRGBO(123, 153, 225, 1),
          Color.fromRGBO(130, 169, 233, 1),
          Color.fromRGBO(128, 165, 231, 1),
          Color.fromRGBO(123, 150, 225, 1),
          Color.fromRGBO(122, 147, 223, 1),
          Color.fromRGBO(171, 186, 227, 1)
        ],
      )),
    );
  }
}
