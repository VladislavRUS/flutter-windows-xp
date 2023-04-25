import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';

@injectable
class HideWindowUseCase extends BaseUseCase<void, HideWindowUseCaseParams> {
  final WindowsRepository _windowsRepository;

  HideWindowUseCase(
    this._windowsRepository,
  );

  @override
  void execute(HideWindowUseCaseParams params) {
    final window = _windowsRepository.getWindowById(params.windowId);

    _windowsRepository.updateWindow(
      window.copyWith(hidden: true),
    );
  }
}

class HideWindowUseCaseParams {
  final String windowId;

  HideWindowUseCaseParams({
    required this.windowId,
  });
}
