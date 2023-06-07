import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';

@injectable
class LoadTracksUseCase
    extends BaseUseCase<Future<void>, LoadTracksUseCaseParams> {
  @override
  Future<void> execute(
    LoadTracksUseCaseParams params,
  ) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (result == null) {
      return;
    }
  }
}

class LoadTracksUseCaseParams {}
