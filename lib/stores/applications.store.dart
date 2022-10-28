import 'package:flutter_windows_xp/common/assets.dart';
import 'package:flutter_windows_xp/components/applications/notepad/notepad.dart';
import 'package:flutter_windows_xp/components/applications/paint/paint.dart';
import 'package:flutter_windows_xp/models/application/application.model.dart';
import 'package:flutter_windows_xp/utils/short_id.dart';
import 'package:mobx/mobx.dart';

import 'root.store.dart';

part 'applications.store.g.dart';

class ApplicationsStore = ApplicationsStoreBase with _$ApplicationsStore;

abstract class ApplicationsStoreBase with Store {
  RootStoreBase rootStore;

  ApplicationsStoreBase(this.rootStore);

  @observable
  List<ApplicationModel> applications = [
    ApplicationModel(
      id: shortId(),
      name: 'Notepad',
      icon: Assets.notepadIcon,
      widget: const Notepad(),
    ),
    ApplicationModel(
      id: shortId(),
      name: 'Paint',
      icon: Assets.paintIcon,
      widget: const Paint(),
    ),
  ];

  @action
  void open(ApplicationModel app) {
    rootStore.windowsStore.openApp(app);
  }

  @action
  void close(ApplicationModel app) {
    rootStore.windowsStore.closeApp(app);
  }
}
