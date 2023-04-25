import 'dart:ui';

import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';

@injectable
class DragWindowUseCase extends BaseUseCase<void, DragWindowUseCaseParams> {
  final WindowsRepository _windowsRepository;

  DragWindowUseCase(
    this._windowsRepository,
  );

  @override
  void execute(DragWindowUseCaseParams params) {
    final window = _windowsRepository.getWindowById(params.windowId);

    _windowsRepository.updateWindow(
      window.copyWith(
        x: window.x + params.offset.dx,
        y: window.y + params.offset.dy,
      ),
    );
  }
}

class DragWindowUseCaseParams {
  final String windowId;
  final Offset offset;

  DragWindowUseCaseParams({
    required this.windowId,
    required this.offset,
  });
}
