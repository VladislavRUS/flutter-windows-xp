import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';

@injectable
class SetRepeatUseCase
    extends BaseUseCase<Future<void>, SetRepeatUseCaseParams> {
  final SettingsRepository _settingsRepository;

  SetRepeatUseCase(
    this._settingsRepository,
  );

  @override
  Future<void> execute(
    SetRepeatUseCaseParams params,
  ) async {
    await _settingsRepository.setRepeat(params.repeat);
  }
}

class SetRepeatUseCaseParams {
  final bool repeat;

  SetRepeatUseCaseParams({
    required this.repeat,
  });
}
