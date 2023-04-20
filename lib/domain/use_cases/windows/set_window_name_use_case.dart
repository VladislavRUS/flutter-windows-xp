import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/repositories/repositories.dart';
import '../base_use_case.dart';

@injectable
class SetWindowNameUseCase
    extends BaseUseCase<void, SetWindowNameUseCaseParams> {
  final WindowsRepository _windowsRepository;

  SetWindowNameUseCase(
    this._windowsRepository,
  );

  @override
  void execute(SetWindowNameUseCaseParams params) {
    final window = _windowsRepository.getWindowById(params.windowId);

    _windowsRepository.updateWindow(
      window.copyWith(
        name: params.name,
      ),
    );
  }
}

class SetWindowNameUseCaseParams {
  final String windowId;
  final String name;

  SetWindowNameUseCaseParams({
    required this.windowId,
    required this.name,
  });
}
