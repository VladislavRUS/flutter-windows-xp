import 'package:flutter_windows_xp/applications/notepad/notepad.dart';
import 'package:flutter_windows_xp/applications/paint/store/colors.store.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools.store.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint.dart';
import 'package:flutter_windows_xp/common/assets.dart';
import 'package:flutter_windows_xp/models/application/application.model.dart';
import 'package:flutter_windows_xp/utils/short_id.dart';
import 'package:mobx/mobx.dart';

part 'paint.store.g.dart';

class PaintStore = PaintStoreBase with _$PaintStore;

abstract class PaintStoreBase with Store {
  late ColorsStore colorsStore;
  late ToolsStore toolsStore;

  PaintStoreBase() {
    colorsStore = ColorsStore(this);
    toolsStore = ToolsStore(this);
  }

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
  void open(ApplicationModel app) {}

  @action
  void close(ApplicationModel app) {}
}
