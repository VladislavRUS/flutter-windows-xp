import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'package:flutter_windows_xp/core/utils/get_short_id.dart';
import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/domain/use_cases/use_cases.dart';

@injectable
class StartApplicationUseCase
    extends BaseUseCase<void, StartApplicationUseCaseParams> {
  final WindowsRepository _windowsRepository;
  final FocusWindowUseCase _focusWindowUseCase;

  StartApplicationUseCase(
    this._windowsRepository,
    this._focusWindowUseCase,
  );

  @override
  void execute(StartApplicationUseCaseParams params) {
    final windowId = getShortId();

    final windows = _windowsRepository.getWindows();

    _windowsRepository.addWindow(
      WindowModel(
        id: windowId,
        application: params.application,
        zIndex: windows.length,
      ),
    );

    _focusWindowUseCase.execute(
      FocusWindowUseCaseParams(
        windowId: windowId,
      ),
    );
  }
}

class StartApplicationUseCaseParams {
  final ApplicationModel application;

  StartApplicationUseCaseParams({
    required this.application,
  });
}
