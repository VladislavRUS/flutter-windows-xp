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
  int maxFlags = 0;

  @observable
  int seconds = 0;

  Timer? _secondsTimer;

  @action
  void setFlagsLeft(int value) {
    flagsLeft = value;
  }

  void startTimer() {
    _secondsTimer = Timer.periodic(
      const Duration(seconds: 1),
      _incrementSeconds,
    );
  }

  @action
  void _incrementSeconds(Timer timer) {
    seconds++;
  }

  void stopTimer() {
    _secondsTimer?.cancel();
  }

  @action
  void _reset() {
    flagsLeft = 0;
    maxFlags = 0;
    seconds = 0;

    stopTimer();
  }

  @action
  void decrementFlagsLeft() {
    if (flagsLeft == 0) {
      return;
    }

    flagsLeft--;
  }

  @action
  void incrementFlagsLeft() {
    if (flagsLeft == maxFlags) {
      return;
    }

    flagsLeft++;
  }

  @action
  void initFromDifficulty(MinesweeperDifficulty difficulty) {
    _reset();

    switch (difficulty) {
      case MinesweeperDifficulty.beginner:
        flagsLeft = 10;
        maxFlags = 10;
        break;
      case MinesweeperDifficulty.intermediate:
        flagsLeft = 40;
        maxFlags = 40;
        break;
      case MinesweeperDifficulty.expert:
        flagsLeft = 99;
        maxFlags = 99;
        break;
    }
  }
}
