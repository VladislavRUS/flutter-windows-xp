import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/core/theme/minesweeper_theme.dart';
import 'package:flutter_windows_xp/applications/minesweeper/data/stores/minesweeper.store.dart';
import 'package:flutter_windows_xp/components/window/window.store.dart';
import 'minesweeper_content/minesweeper_content.dart';

class Minesweeper extends StatefulWidget {
  const Minesweeper({Key? key}) : super(key: key);

  @override
  State<Minesweeper> createState() => _MinesweeperState();
}

class _MinesweeperState extends State<Minesweeper> {
  late MinesweeperStore _minesweeperStore;

  @override
  void initState() {
    super.initState();

    final windowStore = context.read<WindowStore>();
    windowStore.setName('Minesweeper');

    _minesweeperStore = MinesweeperStore(windowStore);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _minesweeperStore),
        Provider.value(value: minesweeperTheme),
      ],
      child: const MinesweeperContent(),
    );
  }
}
