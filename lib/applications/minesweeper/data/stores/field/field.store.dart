import 'dart:ui';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_difficulty.dart';
import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_game_state.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/models/minesweeper_cell.model.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';

part 'field.store.g.dart';

class FieldStore = FieldStoreBase with _$FieldStore;

abstract class FieldStoreBase with Store {
  final MinesweeperStoreBase minesweeperStore;

  FieldStoreBase(this.minesweeperStore);

  final cellSize = 16.0;
  Offset? _prevPosition;

  @observable
  MinesweeperGameState gameState = MinesweeperGameState.idle;

  @observable
  List<List<MinesweeperCellModel>> field = [];

  @observable
  bool isFieldPressed = false;

  @observable
  bool isFieldTouched = false;

  @computed
  bool get isGameFinished =>
      [MinesweeperGameState.lost, MinesweeperGameState.won].contains(gameState);

  MinesweeperCellModel? previousHoveredCell;

  @action
  void setFieldPressed(bool value) {
    isFieldPressed = value;
  }

  @action
  void setField(List<List<MinesweeperCellModel>> value) {
    field = value;
  }

  @action
  void onStart(Offset position) {
    if (gameState == MinesweeperGameState.idle) {
      gameState = MinesweeperGameState.playing;
      minesweeperStore.scoreStore.startTimer();
    }

    setFieldPressed(true);

    _handleFieldPositionUpdate(position);
  }

  @action
  void onUpdate(Offset position) {
    if (!isFieldPressed) {
      return;
    }

    _handleFieldPositionUpdate(position);
  }

  @action
  void _handleFieldPositionUpdate(Offset position) {
    _prevPosition = position;

    final cell = getCellFromPosition(position);

    if (previousHoveredCell != null && previousHoveredCell != cell) {
      previousHoveredCell!.isHovered = false;
    }

    if (cell != null && !cell.isFlagged) {
      cell.isHovered = true;
    }

    previousHoveredCell = cell;
  }

  @action
  void onEnd() {
    setFieldPressed(false);
    previousHoveredCell?.isHovered = false;

    if (_prevPosition == null) {
      return;
    }

    final cell = getCellFromPosition(_prevPosition!);

    if (cell == null) {
      return;
    }

    if (cell.isFlagged) {
      return;
    }

    if (cell.isMine) {
      _gameOver(cell);

      return;
    }

    _openCellsRecursive(cell);
    _checkIfGameIsWon();
  }

  void _checkIfGameIsWon() {
    for (final row in field) {
      for (final cell in row) {
        if (!cell.isMine && !cell.isRevealed && !cell.isFlagged) {
          return;
        }
      }
    }

    _gameWon();
  }

  @action
  void _gameWon() {
    gameState = MinesweeperGameState.won;
    minesweeperStore.scoreStore.stopTimer();
  }

  @action
  void _gameOver(MinesweeperCellModel cell) {
    // Set cell as last revealed
    cell.isLastRevealed = true;

    // Open all mines and flags
    _revealMinesAndFlagged();

    // Set game state
    gameState = MinesweeperGameState.lost;

    minesweeperStore.scoreStore.stopTimer();
  }

  @action
  void _revealMinesAndFlagged() {
    for (final row in field) {
      for (final cell in row) {
        if (cell.isMine || cell.isFlagged) {
          cell.isRevealed = true;
        }
      }
    }
  }

  @action
  void _openCellsRecursive(MinesweeperCellModel cell) {
    if (cell.isRevealed || cell.isFlagged) {
      return;
    }

    cell.isRevealed = true;
    cell.isQuestionMarked = false;

    if (cell.neighbourMines == 0) {
      final cellsAround = _getCellsAround(cell);

      for (final cellAround in cellsAround) {
        _openCellsRecursive(cellAround);
      }
    }
  }

  List<MinesweeperCellModel> _getCellsAround(MinesweeperCellModel cell) {
    final cellsAround = <MinesweeperCellModel>[];

    final x = cell.x;
    final y = cell.y;

    if (x > 0) {
      cellsAround.add(field[y][x - 1]);
    }

    if (x < field[y].length - 1) {
      cellsAround.add(field[y][x + 1]);
    }

    if (y > 0) {
      cellsAround.add(field[y - 1][x]);
    }

    if (y < field.length - 1) {
      cellsAround.add(field[y + 1][x]);
    }

    if (x > 0 && y > 0) {
      cellsAround.add(field[y - 1][x - 1]);
    }

    if (x < field[y].length - 1 && y > 0) {
      cellsAround.add(field[y - 1][x + 1]);
    }

    if (x > 0 && y < field.length - 1) {
      cellsAround.add(field[y + 1][x - 1]);
    }

    if (x < field[y].length - 1 && y < field.length - 1) {
      cellsAround.add(field[y + 1][x + 1]);
    }

    return cellsAround;
  }

  @action
  void onRightClick(MinesweeperCellModel cell) {
    if (cell.isQuestionMarked) {
      cell.isQuestionMarked = false;
    } else if (cell.isFlagged) {
      cell.isFlagged = false;
      minesweeperStore.scoreStore.incrementFlagsLeft();

      cell.isQuestionMarked = true;
    } else if (minesweeperStore.scoreStore.flagsLeft > 0) {
      minesweeperStore.scoreStore.decrementFlagsLeft();

      cell.isFlagged = true;
    }

    _prevPosition = null;
  }

  @action
  void onCancel() {
    setFieldPressed(false);
    previousHoveredCell?.isHovered = false;
  }

  @action
  void initFromDifficulty(MinesweeperDifficulty difficulty) {
    isFieldTouched = false;
    gameState = MinesweeperGameState.idle;

    int width;
    int height;
    int numberOfBombs;

    switch (difficulty) {
      case MinesweeperDifficulty.beginner:
        width = 9;
        height = 9;
        numberOfBombs = 10;
        break;
      case MinesweeperDifficulty.intermediate:
        width = 16;
        height = 16;
        numberOfBombs = 40;
        break;
      case MinesweeperDifficulty.expert:
        width = 30;
        height = 16;
        numberOfBombs = 99;
        break;
    }

    final totalNumberOfCells = width * height;

    final randomIndexes =
        (List<int>.generate(totalNumberOfCells, (index) => index)..shuffle())
            .sublist(
      0,
      numberOfBombs,
    );

    final field = List.generate(
      height,
      (y) => List.generate(
        width,
        (x) => MinesweeperCellModel(
          x: x,
          y: y,
          isMine: randomIndexes.contains(y * width + x),
        ),
      ),
    );

    setField(field);

    // Calculate neighbour mines
    for (var y = 0; y < field.length; y++) {
      for (var x = 0; x < field[y].length; x++) {
        final cell = field[y][x];

        if (cell.isMine) {
          continue;
        }

        final neighbourCells = [
          if (y > 0 && x > 0) field[y - 1][x - 1],
          if (y > 0) field[y - 1][x],
          if (y > 0 && x < field[y].length - 1) field[y - 1][x + 1],
          if (x > 0) field[y][x - 1],
          if (x < field[y].length - 1) field[y][x + 1],
          if (y < field.length - 1 && x > 0) field[y + 1][x - 1],
          if (y < field.length - 1) field[y + 1][x],
          if (y < field.length - 1 && x < field[y].length - 1)
            field[y + 1][x + 1],
        ];

        cell.neighbourMines = neighbourCells.where((c) => c.isMine).length;
      }
    }
  }

  MinesweeperCellModel? getCellFromPosition(Offset position) {
    const borderOffset = -4.0;

    final x = ((position.dx + borderOffset) / cellSize).floor();
    final y = ((position.dy + borderOffset) / cellSize).floor();

    if (x < 0 || y < 0) {
      return null;
    }

    if (x >= field.first.length || y >= field.length) {
      return null;
    }

    return field[y][x];
  }
}
