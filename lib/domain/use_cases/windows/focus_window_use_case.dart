import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';

@injectable
class FocusWindowUseCase extends BaseUseCase<void, FocusWindowUseCaseParams> {
  final WindowsRepository _windowsRepository;

  FocusWindowUseCase(
    this._windowsRepository,
  );

  @override
  void execute(FocusWindowUseCaseParams params) {
    final windows = _windowsRepository.getWindows();

    // Get the window to focus
    final window = windows.firstWhere((window) => window.id == params.windowId);

    // Get the index of the window to focus
    final windowIndex = windows.indexOf(window);

    // Create a new list of windows with the window to focus at the front
    final newWindows = windows
        .map(
          (window) => window.copyWith(
            zIndex: window.zIndex - 1,
            focused: false,
          ),
        )
        .toList();

    // Set the window to focus at the front
    newWindows[windowIndex] = window.copyWith(
      zIndex: 0,
      focused: true,
    );

    for (final window in newWindows) {
      _windowsRepository.updateWindow(window);
    }
  }
}

class FocusWindowUseCaseParams {
  final String windowId;

  FocusWindowUseCaseParams({
    required this.windowId,
  });
}
