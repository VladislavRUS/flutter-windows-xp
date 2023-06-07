import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'package:flutter_windows_xp/applications/winamp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/core/abstracts/base_watcher.dart';

@injectable
class SettingsWatcher
    extends BaseWatcher<SettingsModel, SettingsWatcherParams> {
  final SettingsRepository _settingsRepository;

  SettingsWatcher(this._settingsRepository);

  @override
  Stream<SettingsModel> watch(SettingsWatcherParams params) {
    return _settingsRepository.watchSettings();
  }
}

class SettingsWatcherParams {}
