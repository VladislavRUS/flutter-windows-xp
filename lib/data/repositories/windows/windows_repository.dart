import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/blocs/windows/windows_bloc.dart';
import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/data/models/window/window_model.dart';

@singleton
class WindowsRepository {
  final WindowsBloc _windowsBloc;

  WindowsRepository(this._windowsBloc);

  Stream<List<WindowModel>> watchWindows() {
    return _windowsBloc.stream.map((state) => state.windows);
  }

  void addWindow(WindowModel window) {
    _windowsBloc.saveWindow(window);
  }

  WindowModel getWindowById(String windowId) {
    return _windowsBloc.getWindowById(windowId);
  }

  List<WindowModel> getWindows() {
    return _windowsBloc.getWindows();
  }

  void removeWindow(String windowId) {
    _windowsBloc.removeWindow(windowId);
  }

  void updateWindow(WindowModel window) {
    _windowsBloc.updateWindow(window);
  }
}
