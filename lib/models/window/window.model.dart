import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/models/application/application.model.dart';

part 'window.model.g.dart';

class WindowModel = _WindowModel with _$WindowModel;

abstract class _WindowModel with Store {
  final String id;
  final ApplicationModel application;
  int zIndex;
  @observable
  double width = 800;
  @observable
  double height = 500;
  @observable
  double top = 100;
  @observable
  double left = 100;
  @observable
  bool focused = true;
  @observable
  bool maximized = false;
  @observable
  bool hidden = false;

  _WindowModel({
    required this.id,
    required this.application,
    required this.zIndex,
  });
}
