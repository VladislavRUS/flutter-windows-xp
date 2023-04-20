import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/domain/watchers/windows/windows_watcher.dart';
import 'windows_renderer_state.dart';

@injectable
class WindowsRendererBloc extends Cubit<WindowsRendererState> {
  final WindowsWatcher _windowsWatcher;
  StreamSubscription<List<WindowModel>>? _windowsSubscription;

  WindowsRendererBloc(
    this._windowsWatcher,
  ) : super(const WindowsRendererState(windows: [])) {
    _windowsSubscription =
        _windowsWatcher.watch(WindowsWatcherParams()).listen((windows) {
      emit(WindowsRendererState(windows: windows));
    });
  }

  @override
  Future<void> close() {
    _windowsSubscription?.cancel();

    return super.close();
  }
}
