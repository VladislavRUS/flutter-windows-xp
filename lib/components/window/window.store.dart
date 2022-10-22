import 'package:flutter_windows_xp/models/application/window.model.dart';
import 'package:flutter_windows_xp/stores/root.store.dart';
import 'package:mobx/mobx.dart';

part 'window.store.g.dart';

class WindowStore = WindowStoreBase with _$WindowStore;

abstract class WindowStoreBase with Store {
  final RootStore rootStore;
  final WindowModel window;

  WindowStoreBase(this.rootStore, this.window);

  @observable
  String name = '';

  @action
  void setName(String name) {
    this.name = name;
  }

  @action
  void setFocused() {
    rootStore.windowsStore.focus(window.id);
  }
}
