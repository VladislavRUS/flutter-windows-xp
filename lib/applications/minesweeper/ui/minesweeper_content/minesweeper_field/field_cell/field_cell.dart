import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_game_state.dart';
import 'package:flutter_windows_xp/applications/minesweeper/core/theme/minesweeper_theme.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/models/minesweeper_cell.model.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

class FieldCell extends StatelessWidget {
  final MinesweeperCellModel cell;

  const FieldCell({
    Key? key,
    required this.cell,
  }) : super(key: key);

  Border? _getBorder(BuildContext context) {
    if (cell.isHovered) {
      return null;
    }

    if (cell.isRevealed) {
      if (!cell.isFlagged || !cell.isMine) {
        return null;
      }
    }

    final theme = context.read<MinesweeperTheme>();

    return Border(
      left: BorderSide(
        color: theme.cellLightSideBorder,
        width: 2,
      ),
      top: BorderSide(
        color: theme.cellLightSideBorder,
        width: 2,
      ),
      right: BorderSide(
        color: theme.cellDarkSideBorder,
        width: 2,
      ),
      bottom: BorderSide(
        color: theme.cellDarkSideBorder,
        width: 2,
      ),
    );
  }

  Widget? _buildChild(
    BuildContext context, {
    required MinesweeperGameState gameState,
    required bool isFlagged,
    required bool isQuestionMarked,
    required bool isRevealed,
  }) {
    if (isRevealed) {
      if (cell.isFlagged) {
        if (cell.isMine) {
          return Image.asset(Assets.applications.minesweeper.field.flag.path);
        } else {
          return Image.asset(Assets.applications.minesweeper.field.noBomb.path);
        }
      } else if (cell.isMine) {
        return Image.asset(Assets.applications.minesweeper.field.bomb.path);
      } else if (cell.neighbourMines == 0) {
        return null;
      } else {
        final theme = context.read<MinesweeperTheme>();

        return Text(
          cell.neighbourMines.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: theme.revealedCellColors[cell.neighbourMines - 1],
            fontFamily: 'Montserrat',
          ),
        );
      }
    } else if (gameState == MinesweeperGameState.won && cell.isMine ||
        isFlagged) {
      return Image.asset(Assets.applications.minesweeper.field.flag.path);
    } else if (isQuestionMarked) {
      return Image.asset(
        Assets.applications.minesweeper.field.questionMark.path,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final fieldStore = context.read<MinesweeperStore>().fieldStore;
    final theme = context.read<MinesweeperTheme>();

    return GestureDetector(
      onSecondaryTap: () => fieldStore.onRightClick(cell),
      child: Stack(
        children: [
          Container(
            width: fieldStore.cellSize,
            height: fieldStore.cellSize,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: theme.cellInactiveBorder,
                  width: 1,
                ),
                top: BorderSide(
                  color: theme.cellInactiveBorder,
                  width: 1,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Observer(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    color: cell.isLastRevealed
                        ? theme.lastRevealedMineColor
                        : Colors.transparent,
                    border: _getBorder(context),
                  ),
                  child: Center(
                    child: _buildChild(
                      context,
                      gameState: fieldStore.gameState,
                      isFlagged: cell.isFlagged,
                      isQuestionMarked: cell.isQuestionMarked,
                      isRevealed: cell.isRevealed,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
