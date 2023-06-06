import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';
import 'package:flutter_windows_xp/applications/winamp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/core/abstracts/base_watcher.dart';

@injectable
class PlayingTrackWatcher
    extends BaseWatcher<TrackModel?, PlayingTrackWatcherParams> {
  final TracksRepository _tracksRepository;

  PlayingTrackWatcher(this._tracksRepository);

  @override
  Stream<TrackModel?> watch(PlayingTrackWatcherParams params) {
    return _tracksRepository.watchPlayingTrack();
  }
}

class PlayingTrackWatcherParams {}
