import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_model.freezed.dart';

@freezed
class TrackModel with _$TrackModel {
  const TrackModel._();

  const factory TrackModel({
    required String id,
    required String name,
    required String author,
    required int durationInSeconds,
    required String path,
  }) = _TrackModel;
}
