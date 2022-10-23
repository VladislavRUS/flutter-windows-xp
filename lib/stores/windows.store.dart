import 'package:flutter_windows_xp/models/application/application.model.dart';
import 'package:flutter_windows_xp/models/application/window.model.dart';
import 'package:mobx/mobx.dart';
import 'package:collection/collection.dart';

import 'root.store.dart';

part 'windows.store.g.dart';

class WindowsStore = WindowsStoreBase with _$WindowsStore;

abstract class WindowsStoreBase with Store {
  RootStoreBase rootStore;

  WindowsStoreBase(this.rootStore);

  @observable
  ObservableList<WindowModel> windows = ObservableList();

  @computed
  ObservableList<WindowModel> get sortedWindows => ObservableList.of(
        windows.sorted(
          (first, second) => first.zIndex - second.zIndex,
        ),
      );

  @action
  void openApp(ApplicationModel app) {
    for (final window in windows) {
      window.focused = false;
    }

    windows.add(
      WindowModel(
        id: windows.length.toString(),
        application: app,
        zIndex: windows.length,
      ),
    );
  }

  @action
  void closeApp(ApplicationModel app) {
    windows.removeWhere((element) => element.application.id == app.id);
  }

  @action
  void closeWindow(String windowId) {
    windows.removeWhere((window) => window.id == windowId);
  }

  @action
  void focus(String windowId) {
    final windowIndex = windows.indexWhere((window) => window.id == windowId);
    final window = windows.elementAt(windowIndex);

    windows.removeAt(windowIndex);
    windows.add(window);

    windows.forEachIndexed((index, window) {
      window.zIndex = index;

      if (window.id == windowId) {
        window.focused = true;
      } else {
        window.focused = false;
      }
    });
  }

  @action
  void unfocus(String windowId) {
    final window = windows.firstWhereOrNull((window) => window.id == windowId);

    window?.focused = false;
  }
}
