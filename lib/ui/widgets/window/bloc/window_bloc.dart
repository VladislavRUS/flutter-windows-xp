import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_windows_xp/core/enums/resize_direction.dart';
import 'package:flutter_windows_xp/data/models/models.dart';
import 'package:flutter_windows_xp/domain/use_cases/use_cases.dart';
import 'window_state.dart';

@injectable
class WindowBloc extends Cubit<WindowState> {
  final DragWindowUseCase _dragWindowUseCase;
  final ResizeWindowUseCase _resizeWindowUseCase;
  final SetWindowNameUseCase _setWindowNameUseCase;
  final SetWindowSizeUseCase _setWindowSizeUseCase;
  final ExitWindowUseCase _exitWindowUseCase;
  final FocusWindowUseCase _focusWindowUseCase;
  final UnfocusWindowUseCase _unfocusWindowUseCase;
  final HideWindowUseCase _hideWindowUseCase;
  final ToggleWindowSizeUseCase _toggleWindowSizeUseCase;

  WindowBloc(
    this._dragWindowUseCase,
    this._resizeWindowUseCase,
    this._setWindowNameUseCase,
    this._setWindowSizeUseCase,
    this._exitWindowUseCase,
    this._focusWindowUseCase,
    this._unfocusWindowUseCase,
    this._hideWindowUseCase,
    this._toggleWindowSizeUseCase,
  ) : super(const WindowState());

  void init(WindowModel window) {
    emit(state.copyWith(window: window));
  }

  void drag(Offset offset) {
    _dragWindowUseCase.execute(
      DragWindowUseCaseParams(
        windowId: state.window!.id,
        offset: offset,
      ),
    );
  }

  void resize(Offset offset, ResizeDirection resizeDirection) {
    _resizeWindowUseCase.execute(
      ResizeWindowUseCaseParams(
        windowId: state.window!.id,
        offset: offset,
        resizeDirection: resizeDirection,
      ),
    );
  }

  void setName(String name) {
    _setWindowNameUseCase.execute(
      SetWindowNameUseCaseParams(
        windowId: state.window!.id,
        name: name,
      ),
    );
  }

  void setSize({required double width, required double height}) {
    _setWindowSizeUseCase.execute(
      SetWindowSizeUseCaseParams(
        windowId: state.window!.id,
        width: width,
        height: height,
      ),
    );
  }

  void focus() {
    _focusWindowUseCase
        .execute(FocusWindowUseCaseParams(windowId: state.window!.id));
  }

  void unfocus() {
    _unfocusWindowUseCase
        .execute(UnfocusWindowUseCaseParams(windowId: state.window!.id));
  }

  void exit() {
    _exitWindowUseCase.execute(
      ExitWindowUseCaseParams(
        windowId: state.window!.id,
      ),
    );
  }

  void hide() {
    _hideWindowUseCase.execute(
      HideWindowUseCaseParams(
        windowId: state.window!.id,
      ),
    );
  }

  void toggleSize() {
    _toggleWindowSizeUseCase.execute(
      ToggleWindowSizeUseCaseParams(
        windowId: state.window!.id,
      ),
    );
  }
}
