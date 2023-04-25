import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/winamp/data/blocs/blocs.dart';
import 'package:flutter_windows_xp/applications/winamp/data/models/models.dart';

@singleton
class TracksRepository {
  final TracksBloc _tracksBloc;

  TracksRepository(this._tracksBloc);

  Stream<List<TrackModel>> watchTracks() {
    return _tracksBloc.stream.map((state) => state.tracks);
  }

  Future<List<TrackModel>> getTracks() async {
    return Future.value(_tracksBloc.state.tracks);
  }

  Future<void> updateTrack(TrackModel track) async {
    _tracksBloc.updateTrack(track);
  }

  Future<void> updateTracks(List<TrackModel> tracks) async {
    _tracksBloc.updateTracks(tracks);
  }
}
