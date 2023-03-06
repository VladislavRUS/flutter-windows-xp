import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/theme/minesweeper_theme.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/models/minesweeper_cell.model.dart';

class FieldCell extends StatelessWidget {
  final MinesweeperCellModel cell;

  const FieldCell({
    Key? key,
    required this.cell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<MinesweeperTheme>();

    return Stack(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: theme.cellInactiveBorder,
                width: 1,
              ),
              top: BorderSide(
                color: theme.cellInactiveBorder,
                width: 1,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: theme.cellBackground,
              border: Border(
                left: BorderSide(
                  color: theme.cellLightSideBorder,
                  width: 2,
                ),
                top: BorderSide(
                  color: theme.cellLightSideBorder,
                  width: 2,
                ),
                right: BorderSide(
                  color: theme.cellDarkSideBorder,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: theme.cellDarkSideBorder,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
