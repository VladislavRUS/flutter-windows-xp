import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/applications/minesweeper/ui/minesweeper.dart';
import 'package:flutter_windows_xp/applications/notepad/ui/notepad.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint.dart';
import 'package:flutter_windows_xp/applications/winamp/ui/winamp.dart';
import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'package:flutter_windows_xp/core/utils/get_short_id.dart';
import 'package:flutter_windows_xp/data/models/models.dart';
import 'applications_state.dart';

@singleton
class ApplicationsBloc extends Cubit<ApplicationsState> {
  ApplicationsBloc()
      : super(
          ApplicationsState(
            applications: [
              ApplicationModel(
                id: getShortId(),
                name: 'Notepad',
                icon: Assets.applications.notepad.notepad.path,
                builder: (_) => const Notepad(),
              ),
              ApplicationModel(
                id: getShortId(),
                name: 'Paint',
                icon: Assets.applications.paint.paint.path,
                builder: (_) => const Paint(),
              ),
              ApplicationModel(
                id: getShortId(),
                name: 'Minesweeper',
                icon: Assets.applications.minesweeper.minesweeper.path,
                builder: (_) => const Minesweeper(),
                windowConfig: const WindowConfigModel(
                  resizable: false,
                ),
              ),
              ApplicationModel(
                id: getShortId(),
                name: 'Winamp',
                icon: Assets.applications.winamp.winamp.path,
                builder: (_) => const Winamp(),
              ),
            ],
          ),
        );
}
