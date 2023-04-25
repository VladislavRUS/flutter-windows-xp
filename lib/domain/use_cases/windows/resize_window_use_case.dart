import 'dart:ui';

import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'package:flutter_windows_xp/core/enums/enums.dart';
import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';

@injectable
class ResizeWindowUseCase extends BaseUseCase<void, ResizeWindowUseCaseParams> {
  final WindowsRepository _windowsRepository;

  ResizeWindowUseCase(
    this._windowsRepository,
  );

  @override
  void execute(ResizeWindowUseCaseParams params) {
    final window = _windowsRepository.getWindowById(params.windowId);

    WindowModel? updatedWindow;

    switch (params.resizeDirection) {
      case ResizeDirection.top:
        updatedWindow = window.copyWith(
          y: window.y + params.offset.dy,
          height: window.height - params.offset.dy,
        );

        break;
      case ResizeDirection.right:
        updatedWindow = window.copyWith(
          width: window.width + params.offset.dx,
        );

        break;
      case ResizeDirection.bottom:
        updatedWindow = window.copyWith(
          height: window.height + params.offset.dy,
        );

        break;
      case ResizeDirection.left:
        updatedWindow = window.copyWith(
          x: window.x + params.offset.dx,
          width: window.width - params.offset.dx,
        );

        break;
      case ResizeDirection.topLeft:
        updatedWindow = window.copyWith(
          x: window.x + params.offset.dx,
          width: window.width - params.offset.dx,
          y: window.y + params.offset.dy,
          height: window.height - params.offset.dy,
        );

        break;
      case ResizeDirection.topRight:
        updatedWindow = window.copyWith(
          y: window.y + params.offset.dy,
          height: window.height - params.offset.dy,
          width: window.width + params.offset.dx,
        );

        break;
      case ResizeDirection.bottomRight:
        updatedWindow = window.copyWith(
          height: window.height + params.offset.dy,
          width: window.width + params.offset.dx,
        );

        break;
      case ResizeDirection.bottomLeft:
        updatedWindow = window.copyWith(
          height: window.height + params.offset.dy,
          x: window.x + params.offset.dx,
          width: window.width - params.offset.dx,
        );

        break;
    }

    const minSize = 150.0;

    if (window.width > minSize && updatedWindow.width < minSize ||
        window.height > minSize && updatedWindow.height < minSize) {
      return;
    }

    _windowsRepository.updateWindow(updatedWindow);
  }
}

class ResizeWindowUseCaseParams {
  final String windowId;
  final Offset offset;
  final ResizeDirection resizeDirection;

  ResizeWindowUseCaseParams({
    required this.windowId,
    required this.offset,
    required this.resizeDirection,
  });
}
