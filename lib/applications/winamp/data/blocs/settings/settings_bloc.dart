import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'settings_state.dart';

@singleton
class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc() : super(const SettingsState());

  void setShuffle(bool shuffle) {
    emit(
      state.copyWith(
        shuffle: shuffle,
      ),
    );
  }

  void setRepeat(bool repeat) {
    emit(
      state.copyWith(
        repeat: repeat,
      ),
    );
  }
}
