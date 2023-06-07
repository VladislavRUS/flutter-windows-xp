import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/blocs/blocs.dart';
import 'package:flutter_windows_xp/applications/winamp/data/models/settings/settings_model.dart';

@singleton
class SettingsRepository {
  final SettingsBloc _settingsBloc;

  SettingsRepository(this._settingsBloc);

  Future<void> setShuffle(bool shuffle) async {
    _settingsBloc.setShuffle(shuffle);
  }

  Future<void> setRepeat(bool repeat) async {
    _settingsBloc.setRepeat(repeat);
  }

  Stream<SettingsModel> watchSettings() {
    return _settingsBloc.stream.map(
      (state) => SettingsModel(
        shuffle: state.shuffle,
        repeat: state.repeat,
      ),
    );
  }
}
