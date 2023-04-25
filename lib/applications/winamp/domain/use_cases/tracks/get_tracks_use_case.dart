import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'package:flutter_windows_xp/applications/winamp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/core/abstracts/base_use_case.dart';

@injectable
class GetTracksUseCase
    extends BaseUseCase<Future<List<TrackModel>>, GetTracksUseCaseParams> {
  final TracksRepository _tracksRepository;

  GetTracksUseCase(
    this._tracksRepository,
  );

  @override
  Future<List<TrackModel>> execute(
    GetTracksUseCaseParams params,
  ) async {
    return _tracksRepository.getTracks();
  }
}

class GetTracksUseCaseParams {}
