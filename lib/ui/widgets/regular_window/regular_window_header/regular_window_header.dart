import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'header_action_buttons/header_action_buttons.dart';

class RegularWindowHeader extends StatelessWidget {
  final String? iconPath;
  final String? name;
  final bool focused;
  final bool maximizeDisabled;

  const RegularWindowHeader({
    Key? key,
    required this.iconPath,
    required this.name,
    required this.focused,
    required this.maximizeDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: SizedBox(
        height: 28,
        child: Stack(
          children: [
            _Background(
              focused: focused,
            ),
            SizedBox(
              height: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        if (iconPath != null)
                          Image.asset(
                            iconPath!,
                            width: 15,
                            height: 15,
                          ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            name ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.notoSans(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              shadows: const [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Opacity(
                    opacity: focused ? 1 : 0.6,
                    child: HeaderActionButtons(
                      maximizeDisabled: maximizeDisabled,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
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
                  ),
                ),
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final bool focused;

  const _Background({
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
        ),
      ),
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
        ),
      ),
    );
  }
}
