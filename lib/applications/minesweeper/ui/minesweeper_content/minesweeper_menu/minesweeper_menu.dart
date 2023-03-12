import 'package:flutter/material.dart' hide MenuBar;

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/enums/minesweeper_difficulty.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';
import 'package:flutter_windows_xp/components/custom_menu/custom_menu.dart';
import 'package:flutter_windows_xp/components/custom_menu/menu_descriptors/menu_bar_button_descriptor.dart';
import 'package:flutter_windows_xp/components/custom_menu/menu_descriptors/menu_item_descriptor.dart';

class MinesweeperMenu extends StatelessWidget {
  const MinesweeperMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minesweeperStore = context.read<MinesweeperStore>();
    final difficultyStore = minesweeperStore.difficultyStore;
    final windowStore = minesweeperStore.windowStore;

    return Observer(
      builder: (_) => CustomMenu(
        buttons: [
          MenuBarButtonDescriptor(
            text: 'Game',
            items: [
              MenuItemOptionTextDescriptor(
                text: 'New',
                onTap: () {
                  minesweeperStore.restart();
                },
              ),
              MenuItemDividerDescriptor(),
              MenuItemOptionCheckmarkTextDescriptor(
                text: 'Beginner',
                onTap: () {
                  minesweeperStore.startGame(MinesweeperDifficulty.beginner);
                },
                checked: difficultyStore
                    .isCurrentDifficulty(MinesweeperDifficulty.beginner),
              ),
              MenuItemOptionCheckmarkTextDescriptor(
                text: 'Intermediate',
                onTap: () {
                  minesweeperStore
                      .startGame(MinesweeperDifficulty.intermediate);
                },
                checked: difficultyStore
                    .isCurrentDifficulty(MinesweeperDifficulty.intermediate),
              ),
              MenuItemOptionCheckmarkTextDescriptor(
                text: 'Expert',
                onTap: () {
                  minesweeperStore.startGame(MinesweeperDifficulty.expert);
                },
                checked: difficultyStore
                    .isCurrentDifficulty(MinesweeperDifficulty.expert),
              ),
              MenuItemDividerDescriptor(),
              MenuItemOptionCheckmarkTextDescriptor(
                text: 'Marks (?)',
                onTap: () {},
                checked: true,
              ),
              MenuItemOptionCheckmarkTextDescriptor(
                text: 'Color',
                onTap: () {},
                checked: true,
              ),
              MenuItemOptionTextDescriptor(
                text: 'Sound',
                onTap: () {},
              ),
              MenuItemDividerDescriptor(),
              MenuItemOptionTextDescriptor(
                text: 'Best times',
                onTap: () {},
              ),
              MenuItemDividerDescriptor(),
              MenuItemOptionTextDescriptor(
                text: 'Exit',
                onTap: () {
                  windowStore.close();
                },
              ),
            ],
            menuWidth: 121,
          ),
          MenuBarButtonDescriptor(
            text: 'Help',
            items: [
              MenuItemOptionTextDescriptor(text: 'Contents', onTap: () {}),
            ],
            menuWidth: 160,
          ),
        ],
      ),
    );
  }
}
