import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/components/window/window.dart';
import 'package:flutter_windows_xp/stores/root.store.dart';
import 'package:provider/provider.dart';

class WindowsRenderer extends StatelessWidget {
  const WindowsRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final windowsStore = context.read<RootStore>().windowsStore;

    return Observer(
      builder: (_) {
        return Stack(
          children: [
            ...windowsStore.sortedWindows
                .map(
                  (window) => Window(
                    key: Key(window.id),
                    window: window,
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}
