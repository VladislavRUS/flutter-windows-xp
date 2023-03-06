import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/theme/minesweeper_theme.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';
import 'field_cell/field_cell.dart';

class MinesweeperField extends StatelessWidget {
  const MinesweeperField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<MinesweeperTheme>();
    final fieldStore = context.read<MinesweeperStore>().fieldStore;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: theme.fieldDarkSideBorder,
            width: 3,
          ),
          top: BorderSide(
            color: theme.fieldDarkSideBorder,
            width: 3,
          ),
          right: BorderSide(
            color: theme.fieldLightSideBorder,
            width: 3,
          ),
          bottom: BorderSide(
            color: theme.fieldLightSideBorder,
            width: 3,
          ),
        ),
      ),
      child: Center(
        child: Observer(
          builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                fieldStore.field.length,
                (rowIndex) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      fieldStore.field[rowIndex].length,
                      (columnIndex) {
                        final cell = fieldStore.field[rowIndex][columnIndex];

                        return FieldCell(
                          cell: cell,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
