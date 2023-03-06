import 'dart:async';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_difficulty.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';

part 'score.store.g.dart';

class ScoreStore = ScoreStoreBase with _$ScoreStore;

abstract class ScoreStoreBase with Store {
  final MinesweeperStoreBase minesweeperStore;

  ScoreStoreBase(this.minesweeperStore);

  @observable
  int flagsLeft = 0;

  @observable
  int seconds = 0;

  Timer? _secondsTimer;

  @action
  void setFlagsLeft(int value) {
    flagsLeft = value;
  }

  @action
  void initFromDifficulty(MinesweeperDifficulty difficulty) {
    _secondsTimer?.cancel();

    switch (difficulty) {
      case MinesweeperDifficulty.beginner:
        flagsLeft = 10;
        break;
      case MinesweeperDifficulty.intermediate:
        flagsLeft = 40;
        break;
      case MinesweeperDifficulty.expert:
        flagsLeft = 99;
        break;
    }
  }
}
