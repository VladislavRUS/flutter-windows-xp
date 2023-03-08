import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/theme/minesweeper_theme.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';
import 'package:flutter_windows_xp/applications/minesweeper/ui/minesweeper_content/minesweeper_score/score_face/score_face.dart';
import 'score_digits/score_digits.dart';

class MinesweeperScore extends StatelessWidget {
  const MinesweeperScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<MinesweeperTheme>();
    final scoreStore = context.read<MinesweeperStore>().scoreStore;

    return Container(
      height: 34,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: theme.scoreDarkSideBorder,
            width: 2,
          ),
          top: BorderSide(
            color: theme.scoreDarkSideBorder,
            width: 2,
          ),
          right: BorderSide(
            color: theme.scoreLightSideBorder,
            width: 2,
          ),
          bottom: BorderSide(
            color: theme.scoreLightSideBorder,
            width: 2,
          ),
        ),
      ),
      child: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScoreDigits(
                value: scoreStore.flagsLeft,
              ),
              const ScoreFace(),
              ScoreDigits(
                value: scoreStore.seconds,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
