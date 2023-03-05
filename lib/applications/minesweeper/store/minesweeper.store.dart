import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/minesweeper/enums/minesweeper_difficulty.dart';
import 'package:flutter_windows_xp/components/window/window.store.dart';
import 'difficulty.store.dart';

part 'minesweeper.store.g.dart';

class MinesweeperStore = MinesweeperStoreBase with _$MinesweeperStore;

abstract class MinesweeperStoreBase with Store {
  final WindowStore windowStore;
  late DifficultyStore difficultyStore;

  MinesweeperStoreBase(this.windowStore) {
    difficultyStore = DifficultyStore(this);

    difficultyStore.setDifficulty(MinesweeperDifficulty.beginner);
  }
}
