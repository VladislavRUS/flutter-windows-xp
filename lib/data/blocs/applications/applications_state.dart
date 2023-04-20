import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_windows_xp/data/models/application/application_model.dart';

part 'applications_state.freezed.dart';

@freezed
class ApplicationsState with _$ApplicationsState {
  const factory ApplicationsState({
    required List<ApplicationModel> applications,
  }) = _ApplicationsState;
}
