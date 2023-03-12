import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_difficulty.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';

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
  }

  bool isCurrentDifficulty(MinesweeperDifficulty value) {
    return difficulty == value;
  }
}
