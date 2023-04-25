import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';

@injectable
class SetWindowSizeUseCase
    extends BaseUseCase<void, SetWindowSizeUseCaseParams> {
  final WindowsRepository _windowsRepository;

  SetWindowSizeUseCase(
    this._windowsRepository,
  );

  @override
  void execute(SetWindowSizeUseCaseParams params) {
    final window = _windowsRepository.getWindowById(params.windowId);

    _windowsRepository.updateWindow(
      window.copyWith(
        width: params.width,
        height: params.height,
      ),
    );
  }
}

class SetWindowSizeUseCaseParams {
  final String windowId;
  final double width;
  final double height;

  SetWindowSizeUseCaseParams({
    required this.windowId,
    required this.width,
    required this.height,
  });
}
