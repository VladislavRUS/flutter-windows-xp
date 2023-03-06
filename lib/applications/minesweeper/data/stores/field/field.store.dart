import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_difficulty.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/models/minesweeper_cell.model.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';

part 'field.store.g.dart';

class FieldStore = FieldStoreBase with _$FieldStore;

abstract class FieldStoreBase with Store {
  final MinesweeperStoreBase minesweeperStore;

  FieldStoreBase(this.minesweeperStore);

  @observable
  List<List<MinesweeperCellModel>> field = [];

  @action
  void setField(List<List<MinesweeperCellModel>> field) {
    this.field = field;
  }

  @action
  void initFromDifficulty(MinesweeperDifficulty difficulty) {
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
          '$x:$y',
          isMine: randomIndexes.contains(y * width + x),
        ),
      ),
    );

    setField(field);
  }
}
