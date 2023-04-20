import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/domain/use_cases/use_cases.dart';
import 'desktop_renderer_state.dart';

@injectable
class DesktopRendererBloc extends Cubit<DesktopRendererState> {
  final GetApplicationsUseCase _getApplicationsUseCase;
  final StartApplicationUseCase _startApplicationUseCase;

  DesktopRendererBloc(
    this._getApplicationsUseCase,
    this._startApplicationUseCase,
  ) : super(const DesktopRendererState(applications: []));

  Future<void> init() async {
    final applications =
        await _getApplicationsUseCase.execute(GetApplicationsUseCaseParams());

    emit(state.copyWith(applications: applications));
  }

  void onStartApplication(ApplicationModel application) {
    _startApplicationUseCase
        .execute(StartApplicationUseCaseParams(application: application));
  }
}
