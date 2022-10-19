import 'package:flutter_windows_xp/stores/applications.store.dart';
import 'package:mobx/mobx.dart';

part 'root.store.g.dart';

class RootStore = RootStoreBase with _$RootStore;

abstract class RootStoreBase with Store {
  late ApplicationsStore applicationsStore;

  RootStoreBase() {
    applicationsStore = ApplicationsStore(this);
  }
}
