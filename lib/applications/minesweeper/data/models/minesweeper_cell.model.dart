import 'package:mobx/mobx.dart';

part 'minesweeper_cell.model.g.dart';

class MinesweeperCellModel = MinesweeperCellModelBase
    with _$MinesweeperCellModel;

abstract class MinesweeperCellModelBase with Store {
  String get id => '$x-$y';

  int x;
  int y;

  @observable
  bool isMine;

  @observable
  bool isLastRevealed;

  @observable
  bool isFlagged;

  @observable
  bool isQuestionMarked;

  @observable
  bool isRevealed;

  @observable
  bool isHovered;

  @observable
  int neighbourMines;

  @computed
  bool get isWronglyFlagged => isFlagged && !isMine;

  MinesweeperCellModelBase({
    required this.x,
    required this.y,
    this.isMine = false,
    this.isLastRevealed = false,
    this.isFlagged = false,
    this.isQuestionMarked = false,
    this.isRevealed = false,
    this.isHovered = false,
    this.neighbourMines = 0,
  });
}
