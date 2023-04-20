import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/data/repositories/repositories.dart';
import 'package:flutter_windows_xp/domain/watchers/base_watcher.dart';

@injectable
class ApplicationsWatcher
    extends BaseWatcher<List<ApplicationModel>, ApplicationsWatcherParams> {
  final ApplicationsRepository _applicationsRepository;

  ApplicationsWatcher(this._applicationsRepository);

  @override
  Stream<List<ApplicationModel>> watch(ApplicationsWatcherParams params) {
    return _applicationsRepository.watchApplications();
  }
}

class ApplicationsWatcherParams {}
