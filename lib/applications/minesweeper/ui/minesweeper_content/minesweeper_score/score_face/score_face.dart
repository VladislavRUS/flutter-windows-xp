import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_game_state.dart';
import 'package:flutter_windows_xp/applications/minesweeper/core/theme/minesweeper_theme.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';

class ScoreFace extends StatefulWidget {
  const ScoreFace({Key? key}) : super(key: key);

  @override
  State<ScoreFace> createState() => _ScoreFaceState();
}

class _ScoreFaceState extends State<ScoreFace> {
  bool _isPressed = false;

  void _onSetPress(bool isPressed) {
    setState(() {
      _isPressed = isPressed;
    });
  }

  Border _getInnerBorder(BuildContext context) {
    final theme = context.read<MinesweeperTheme>();

    if (!_isPressed) {
      return Border(
        left: BorderSide(
          color: theme.scoreFaceInnerLightBorder,
          width: 2,
        ),
        top: BorderSide(
          color: theme.scoreFaceInnerLightBorder,
          width: 2,
        ),
        right: BorderSide(
          color: theme.scoreFaceInnerDarkBorder,
          width: 1,
        ),
        bottom: BorderSide(
          color: theme.scoreFaceInnerDarkBorder,
          width: 1,
        ),
      );
    }

    return Border(
      left: BorderSide(
        color: theme.scoreFaceInnerDarkBorder,
        width: 1,
      ),
      top: BorderSide(
        color: theme.scoreFaceInnerDarkBorder,
        width: 1,
      ),
    );
  }

  Widget _buildFaceImage({
    required MinesweeperGameState gameState,
    required bool isFieldPressed,
  }) {
    String asset;

    if (isFieldPressed) {
      asset = Assets.apps.minesweeper.face.oh.path;
    } else if (gameState == MinesweeperGameState.lost) {
      asset = Assets.apps.minesweeper.face.dead.path;
    } else if (gameState == MinesweeperGameState.won) {
      asset = Assets.apps.minesweeper.face.won.path;
    } else {
      asset = Assets.apps.minesweeper.face.smile.path;
    }

    return Image.asset(
      asset,
      width: 17,
      height: 17,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<MinesweeperTheme>();
    final minesweeperStore = context.read<MinesweeperStore>();
    final fieldStore = minesweeperStore.fieldStore;

    return GestureDetector(
      onTapDown: (_) => _onSetPress(true),
      onTapCancel: () => _onSetPress(false),
      onTapUp: (_) {
        _onSetPress(false);
        minesweeperStore.restart();
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.scoreFaceOuterBorder,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: _getInnerBorder(context),
          ),
          child: Transform.translate(
            offset: _isPressed ? const Offset(0.5, 0.5) : Offset.zero,
            child: Observer(
              builder: (_) => _buildFaceImage(
                gameState: fieldStore.gameState,
                isFieldPressed: fieldStore.isFieldPressed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
