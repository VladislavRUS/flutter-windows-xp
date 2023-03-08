import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/models/application/application.model.dart';
import 'package:flutter_windows_xp/models/window_properties/window_properties.model.dart';

part 'window.model.g.dart';

class WindowModel = _WindowModel with _$WindowModel;

abstract class _WindowModel with Store {
  final String id;
  final ApplicationModel application;
  final WindowPropertiesModel? properties;
  int zIndex;

  @observable
  double width = 0;
  @observable
  double height = 0;
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
    required this.properties,
    required this.zIndex,
  });
}
