import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/blocs/applications/applications_bloc.dart';
import 'package:flutter_windows_xp/data/models/application/application_model.dart';

@singleton
class ApplicationsRepository {
  final ApplicationsBloc _applicationsBloc;

  ApplicationsRepository(this._applicationsBloc);

  Future<List<ApplicationModel>> getApplications() async {
    return Future.value(_applicationsBloc.state.applications);
  }

  Stream<List<ApplicationModel>> watchApplications() {
    return _applicationsBloc.stream.map((state) => state.applications);
  }
}
