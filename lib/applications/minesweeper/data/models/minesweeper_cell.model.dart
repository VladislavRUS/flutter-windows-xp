class MinesweeperCellModel {
  final String id;
  bool isMine;
  bool isFlagged;
  bool isRevealed;
  int neighbourMines;

  MinesweeperCellModel(
    this.id, {
    this.isMine = false,
    this.isFlagged = false,
    this.isRevealed = false,
    this.neighbourMines = 0,
  });
}
