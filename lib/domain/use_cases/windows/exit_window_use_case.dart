import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';

@injectable
class ExitWindowUseCase extends BaseUseCase<void, ExitWindowUseCaseParams> {
  final WindowsRepository _windowsRepository;

  ExitWindowUseCase(
    this._windowsRepository,
  );

  @override
  void execute(ExitWindowUseCaseParams params) {
    _windowsRepository.removeWindow(params.windowId);
  }
}

class ExitWindowUseCaseParams {
  final String windowId;

  ExitWindowUseCaseParams({
    required this.windowId,
  });
}
