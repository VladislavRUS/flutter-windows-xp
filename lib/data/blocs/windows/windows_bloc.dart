import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/data/models/window/window_model.dart';
import 'windows_state.dart';

@singleton
class WindowsBloc extends Cubit<WindowsState> {
  WindowsBloc() : super(const WindowsState(windows: []));

  void saveWindow(WindowModel windowModel) {
    emit(
      WindowsState(
        windows: [
          ...state.windows,
          windowModel,
        ],
      ),
    );
  }

  void updateWindow(WindowModel windowModel) {
    emit(
      WindowsState(
        windows: state.windows.map((w) {
          if (w.id == windowModel.id) {
            return windowModel;
          }

          return w;
        }).toList(),
      ),
    );
  }

  void removeWindow(String windowId) {
    emit(
      WindowsState(
        windows: state.windows.where((w) => w.id != windowId).toList(),
      ),
    );
  }

  WindowModel getWindowById(String windowId) {
    return state.windows.firstWhere((w) => w.id == windowId);
  }

  List<WindowModel> getWindows() {
    return state.windows;
  }
}
