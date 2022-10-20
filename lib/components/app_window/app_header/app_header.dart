import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Stack(
        children: [
          Container(
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
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 3,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [
                  0,
                  1,
                ],
                colors: [
                  Color.fromRGBO(22, 56, 230, 0.4),
                  Colors.transparent,
                ],
              )),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 3,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [
                  0,
                  1,
                ],
                colors: [
                  Color.fromRGBO(22, 56, 230, 0.4),
                  Colors.transparent,
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
