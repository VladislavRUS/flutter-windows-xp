import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/stores/applications.store.dart';
import 'package:flutter_windows_xp/stores/windows.store.dart';

part 'root.store.g.dart';

class RootStore = RootStoreBase with _$RootStore;

abstract class RootStoreBase with Store {
  late ApplicationsStore applicationsStore;
  late WindowsStore windowsStore;

  RootStoreBase() {
    applicationsStore = ApplicationsStore(this);
    windowsStore = WindowsStore(this);
  }
}
