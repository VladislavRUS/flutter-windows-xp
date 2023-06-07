import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';

@injectable
class SetShuffleUseCase
    extends BaseUseCase<Future<void>, SetShuffleUseCaseParams> {
  final SettingsRepository _settingsRepository;

  SetShuffleUseCase(
    this._settingsRepository,
  );

  @override
  Future<void> execute(
    SetShuffleUseCaseParams params,
  ) async {
    await _settingsRepository.setShuffle(params.shuffle);
  }
}

class SetShuffleUseCaseParams {
  final bool shuffle;

  SetShuffleUseCaseParams({
    required this.shuffle,
  });
}
