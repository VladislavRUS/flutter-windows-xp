import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/theme/minesweeper_theme.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

final _digitsMap = {
  '0': Assets.applications.minesweeper.digits.zero,
  '1': Assets.applications.minesweeper.digits.one,
  '2': Assets.applications.minesweeper.digits.two,
  '3': Assets.applications.minesweeper.digits.three,
  '4': Assets.applications.minesweeper.digits.four,
  '5': Assets.applications.minesweeper.digits.five,
  '6': Assets.applications.minesweeper.digits.six,
  '7': Assets.applications.minesweeper.digits.seven,
  '8': Assets.applications.minesweeper.digits.eight,
  '9': Assets.applications.minesweeper.digits.nine,
};

class ScoreDigits extends StatelessWidget {
  final int value;

  const ScoreDigits({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<MinesweeperTheme>();

    final digits = value.toString().padLeft(3, '0');

    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: theme.scoreDigitsBorder,
            width: 1,
          ),
          bottom: BorderSide(
            color: theme.scoreDigitsBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: digits
            .split('')
            .map(
              (digit) => Image.asset(
                _digitsMap[digit]!.path,
                width: 13,
                height: 23,
              ),
            )
            .toList(),
      ),
    );
  }
}
