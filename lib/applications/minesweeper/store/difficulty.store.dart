import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/minesweeper/enums/minesweeper_difficulty.dart';
import 'package:flutter_windows_xp/applications/minesweeper/store/minesweeper.store.dart';

part 'difficulty.store.g.dart';

class DifficultyStore = DifficultyStoreBase with _$DifficultyStore;

abstract class DifficultyStoreBase with Store {
  final MinesweeperStoreBase minesweeperStore;

  DifficultyStoreBase(this.minesweeperStore);

  @observable
  MinesweeperDifficulty difficulty = MinesweeperDifficulty.beginner;

  @action
  void setDifficulty(MinesweeperDifficulty difficulty) {
    this.difficulty = difficulty;

    _setWindowSizeDependingOnDifficulty(difficulty);
  }

  @action
  void _setWindowSizeDependingOnDifficulty(MinesweeperDifficulty difficulty) {
    switch (difficulty) {
      case MinesweeperDifficulty.beginner:
        minesweeperStore.windowStore.setSize(169, 253);
        break;
      case MinesweeperDifficulty.intermediate:
        minesweeperStore.windowStore.setSize(281, 365);
        break;
      case MinesweeperDifficulty.expert:
        minesweeperStore.windowStore.setSize(505, 365);
        break;
    }
  }
}
