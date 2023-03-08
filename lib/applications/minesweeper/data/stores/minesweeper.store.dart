import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_difficulty.dart';
import 'package:flutter_windows_xp/components/window/window.store.dart';
import 'difficulty/difficulty.store.dart';
import 'field/field.store.dart';
import 'score/score.store.dart';

part 'minesweeper.store.g.dart';

class MinesweeperStore = MinesweeperStoreBase with _$MinesweeperStore;

abstract class MinesweeperStoreBase with Store {
  final WindowStore windowStore;
  late FieldStore fieldStore;
  late ScoreStore scoreStore;
  late DifficultyStore difficultyStore;

  MinesweeperStoreBase(this.windowStore) {
    fieldStore = FieldStore(this);
    scoreStore = ScoreStore(this);
    difficultyStore = DifficultyStore(this);

    startGame(MinesweeperDifficulty.beginner);
  }

  @action
  void startGame(MinesweeperDifficulty difficulty) {
    _setWindowSizeDependingOnDifficulty(difficulty);

    difficultyStore.setDifficulty(difficulty);

    fieldStore.initFromDifficulty(difficulty);
    scoreStore.initFromDifficulty(difficulty);
  }

  @action
  void restart() {
    startGame(difficultyStore.difficulty);
  }

  @action
  void _setWindowSizeDependingOnDifficulty(MinesweeperDifficulty difficulty) {
    switch (difficulty) {
      case MinesweeperDifficulty.beginner:
        windowStore.setSize(169, 253);
        break;
      case MinesweeperDifficulty.intermediate:
        windowStore.setSize(281, 365);
        break;
      case MinesweeperDifficulty.expert:
        windowStore.setSize(505, 365);

        break;
    }
  }
}
