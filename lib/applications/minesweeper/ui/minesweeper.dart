import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/minesweeper/store/minesweeper.store.dart';
import 'package:flutter_windows_xp/components/window/window.store.dart';

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

    _minesweeperStore = MinesweeperStore(windowStore);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _minesweeperStore,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
