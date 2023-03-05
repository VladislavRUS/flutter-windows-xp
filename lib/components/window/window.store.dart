import 'package:flutter/gestures.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/models/window/window.model.dart';
import 'package:flutter_windows_xp/stores/root.store.dart';

part 'window.store.g.dart';

class WindowStore = WindowStoreBase with _$WindowStore;

class WindowPosition {
  final double top;
  final double left;
  final double width;
  final double height;

  WindowPosition({
    required this.top,
    required this.left,
    required this.width,
    required this.height,
  });
}

abstract class WindowStoreBase with Store {
  final RootStore rootStore;
  final WindowModel window;

  final _minWidth = 200;
  final _minHeight = 200;
  WindowPosition? _prevPosition;

  WindowStoreBase(this.rootStore, this.window);

  @observable
  String name = '';

  @action
  void setName(String name) {
    this.name = name;
  }

  @action
  void setSize(double width, double height) {
    window.width = width;
    window.height = height;
  }

  bool _checkSize(double nextWidth, double nextHeight) {
    if (nextWidth < _minWidth) {
      return false;
    }

    if (nextHeight < _minHeight) {
      return false;
    }

    return true;
  }

  @action
  void onDragTopLeftCorner(DragUpdateDetails details) {
    final nextWidth = window.width - details.delta.dx;
    final nextHeight = window.height - details.delta.dy;

    if (!_checkSize(nextWidth, nextHeight)) {
      return;
    }

    window.left += details.delta.dx;
    window.top += details.delta.dy;

    window.width = nextWidth;
    window.height = nextHeight;
  }

  @action
  void onDragTopRightCorner(DragUpdateDetails details) {
    final nextWidth = window.width + details.delta.dx;
    final nextHeight = window.height - details.delta.dy;

    if (!_checkSize(nextWidth, nextHeight)) {
      return;
    }

    window.width = nextWidth;
    window.height = nextHeight;

    window.top += details.delta.dy;
  }

  @action
  void onDragBottomRightCorner(DragUpdateDetails details) {
    final nextWidth = window.width + details.delta.dx;
    final nextHeight = window.height + details.delta.dy;

    if (!_checkSize(nextWidth, nextHeight)) {
      return;
    }

    window.width = nextWidth;
    window.height = nextHeight;
  }

  @action
  void onDragBottomLeftCorner(DragUpdateDetails details) {
    final nextWidth = window.width - details.delta.dx;
    final nextHeight = window.height + details.delta.dy;

    if (!_checkSize(nextWidth, nextHeight)) {
      return;
    }

    window.left += details.delta.dx;

    window.width = nextWidth;
    window.height = nextHeight;
  }

  @action
  void onDragUpdate(DragUpdateDetails details) {
    window.left += details.delta.dx;
    window.top += details.delta.dy;
  }

  @action
  void setFocused() {
    rootStore.windowsStore.focus(window.id);
  }

  @action
  void unfocus() {
    rootStore.windowsStore.unfocus(window.id);
  }

  @action
  void hide() {
    window.hidden = true;
  }

  @action
  void toggleSize() {
    window.maximized = !window.maximized;

    if (window.maximized) {
      _prevPosition = WindowPosition(
        top: window.top,
        left: window.left,
        width: window.width,
        height: window.height,
      );

      window.top = 0;
      window.left = 0;
    } else if (_prevPosition != null) {
      final pos = _prevPosition!;

      window.top = pos.top;
      window.left = pos.left;
      window.width = pos.width;
      window.height = pos.height;
    }
  }

  @action
  void close() {
    rootStore.windowsStore.closeWindow(window.id);
  }
}
