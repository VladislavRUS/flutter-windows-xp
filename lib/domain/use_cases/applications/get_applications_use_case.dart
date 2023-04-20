import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';
import '../base_use_case.dart';

@injectable
class GetApplicationsUseCase extends BaseUseCase<Future<List<ApplicationModel>>,
    GetApplicationsUseCaseParams> {
  final ApplicationsRepository _applicationsRepository;

  GetApplicationsUseCase(
    this._applicationsRepository,
  );

  @override
  Future<List<ApplicationModel>> execute(
    GetApplicationsUseCaseParams params,
  ) async {
    return _applicationsRepository.getApplications();
  }
}

class GetApplicationsUseCaseParams {}
