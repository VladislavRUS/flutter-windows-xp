import 'package:flutter/material.dart';

final minesweeperTheme = MinesweeperTheme(
  background: const Color.fromRGBO(192, 192, 192, 1),
  menuBackground: const Color.fromRGBO(236, 233, 216, 1),
  contentBorder: const Color.fromRGBO(245, 245, 245, 1),
  fieldDarkSideBorder: const Color.fromRGBO(128, 128, 128, 1),
  fieldLightSideBorder: const Color.fromRGBO(245, 245, 245, 1),
  scoreDarkSideBorder: const Color.fromRGBO(128, 128, 128, 1),
  scoreLightSideBorder: const Color.fromRGBO(245, 245, 245, 1),
  cellBackground: const Color.fromRGBO(192, 192, 192, 1),
  cellLightSideBorder: const Color.fromRGBO(245, 245, 245, 1),
  cellDarkSideBorder: const Color.fromRGBO(128, 128, 128, 1),
  cellInactiveBorder: const Color.fromRGBO(128, 128, 128, 1),
  scoreDigitsBorder: const Color.fromRGBO(255, 255, 255, 1),
  scoreFaceOuterBorder: const Color.fromRGBO(128, 128, 128, 1),
  scoreFaceInnerLightBorder: const Color.fromRGBO(245, 245, 245, 1),
  scoreFaceInnerDarkBorder: const Color.fromRGBO(128, 128, 128, 1),
  revealedCellColors: [
    const Color.fromRGBO(0, 0, 255, 1),
    const Color.fromRGBO(0, 128, 0, 1),
    const Color.fromRGBO(255, 0, 0, 1),
    const Color.fromRGBO(0, 0, 128, 1),
    const Color.fromRGBO(128, 0, 0, 1),
    const Color.fromRGBO(0, 128, 128, 1),
    const Color.fromRGBO(0, 0, 0, 1),
    const Color.fromRGBO(128, 128, 128, 1),
  ],
  lastRevealedMineColor: const Color.fromRGBO(255, 0, 0, 1),
);

class MinesweeperTheme {
  final Color background;
  final Color menuBackground;
  final Color contentBorder;
  final Color fieldDarkSideBorder;
  final Color fieldLightSideBorder;
  final Color scoreDarkSideBorder;
  final Color scoreLightSideBorder;
  final Color cellBackground;
  final Color cellLightSideBorder;
  final Color cellDarkSideBorder;
  final Color cellInactiveBorder;
  final Color scoreDigitsBorder;
  final Color scoreFaceOuterBorder;
  final Color scoreFaceInnerLightBorder;
  final Color scoreFaceInnerDarkBorder;
  final List<Color> revealedCellColors;
  final Color lastRevealedMineColor;

  MinesweeperTheme({
    required this.background,
    required this.menuBackground,
    required this.contentBorder,
    required this.fieldDarkSideBorder,
    required this.fieldLightSideBorder,
    required this.scoreDarkSideBorder,
    required this.scoreLightSideBorder,
    required this.cellBackground,
    required this.cellLightSideBorder,
    required this.cellDarkSideBorder,
    required this.cellInactiveBorder,
    required this.scoreDigitsBorder,
    required this.scoreFaceOuterBorder,
    required this.scoreFaceInnerLightBorder,
    required this.scoreFaceInnerDarkBorder,
    required this.revealedCellColors,
    required this.lastRevealedMineColor,
  });
}
