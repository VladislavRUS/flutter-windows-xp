import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/theme/minesweeper_theme.dart';
import 'minesweeper_field/minesweeper_field.dart';
import 'minesweeper_menu/minesweeper_menu.dart';
import 'minesweeper_score/minesweeper_score.dart';

class MinesweeperContent extends StatelessWidget {
  const MinesweeperContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<MinesweeperTheme>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const MinesweeperMenu(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: theme.background,
              border: Border(
                left: BorderSide(
                  color: theme.contentBorder,
                  width: 3,
                ),
                top: BorderSide(
                  color: theme.contentBorder,
                  width: 3,
                ),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MinesweeperScore(),
                SizedBox(height: 5),
                Expanded(
                  child: MinesweeperField(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
