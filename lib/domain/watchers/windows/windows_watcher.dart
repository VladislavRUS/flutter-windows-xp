import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/domain/watchers/base_watcher.dart';

@injectable
class WindowsWatcher
    extends BaseWatcher<List<WindowModel>, WindowsWatcherParams> {
  final WindowsRepository _windowsRepository;

  WindowsWatcher(this._windowsRepository);

  @override
  Stream<List<WindowModel>> watch(WindowsWatcherParams params) {
    return _windowsRepository.watchWindows();
  }
}

class WindowsWatcherParams {}
