import 'package:flutter_windows_xp/models/application/application.model.dart';
import 'package:mobx/mobx.dart';

part 'window.model.g.dart';

class WindowModel = _WindowModel with _$WindowModel;

abstract class _WindowModel with Store {
  final String id;
  final ApplicationModel application;
  int zIndex;

  @observable
  bool focused = true;

  _WindowModel({
    required this.id,
    required this.application,
    required this.zIndex,
  });
}
