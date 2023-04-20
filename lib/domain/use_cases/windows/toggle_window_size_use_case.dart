import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/repositories/repositories.dart';
import '../base_use_case.dart';

@injectable
class ToggleWindowSizeUseCase
    extends BaseUseCase<void, ToggleWindowSizeUseCaseParams> {
  final WindowsRepository _windowsRepository;

  ToggleWindowSizeUseCase(
    this._windowsRepository,
  );

  @override
  void execute(ToggleWindowSizeUseCaseParams params) {
    final window = _windowsRepository.getWindowById(params.windowId);

    _windowsRepository.updateWindow(
      window.copyWith(
        maximized: !window.maximized,
      ),
    );
  }
}

class ToggleWindowSizeUseCaseParams {
  final String windowId;

  ToggleWindowSizeUseCaseParams({
    required this.windowId,
  });
}
