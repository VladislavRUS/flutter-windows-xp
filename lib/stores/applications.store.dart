import 'package:flutter_windows_xp/common/assets.dart';
import 'package:flutter_windows_xp/components/applications/notepad/notepad.dart';
import 'package:flutter_windows_xp/models/application/application.model.dart';
import 'package:mobx/mobx.dart';
import 'package:short_uuids/short_uuids.dart';

import 'root.store.dart';

part 'applications.store.g.dart';

class ApplicationsStore = ApplicationsStoreBase with _$ApplicationsStore;

abstract class ApplicationsStoreBase with Store {
  RootStoreBase rootStore;

  ApplicationsStoreBase(this.rootStore);

  @observable
  List<ApplicationModel> applications = [
    ApplicationModel(
      id: const ShortUuid().generate(),
      name: 'Notepad',
      icon: Assets.notepadIcon,
      widget: const Notepad(),
      opened: false,
    )
  ];

  List<ApplicationModel> get openedApplications =>
      applications.where((element) => element.opened).toList();

  @action
  void open(String id) {
    applications = applications
        .map((app) => app.id == id ? app.copyWith(opened: true) : app)
        .toList();
  }

  @action
  void close(String id) {
    applications = applications
        .map((app) => app.id == id ? app.copyWith(opened: false) : app)
        .toList();
  }
}
