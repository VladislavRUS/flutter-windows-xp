import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/repositories/repositories.dart';
import '../base_use_case.dart';

@injectable
class UnfocusWindowUseCase
    extends BaseUseCase<void, UnfocusWindowUseCaseParams> {
  final WindowsRepository _windowsRepository;

  UnfocusWindowUseCase(
    this._windowsRepository,
  );

  @override
  void execute(UnfocusWindowUseCaseParams params) {
    final window = _windowsRepository.getWindowById(params.windowId);

    _windowsRepository.updateWindow(
      window.copyWith(
        focused: false,
      ),
    );
  }
}

class UnfocusWindowUseCaseParams {
  final String windowId;

  UnfocusWindowUseCaseParams({
    required this.windowId,
  });
}
