import 'package:flutter/gestures.dart';
import 'package:flutter_windows_xp/models/application/window.model.dart';
import 'package:flutter_windows_xp/stores/root.store.dart';
import 'package:mobx/mobx.dart';

part 'window.store.g.dart';

class WindowStore = WindowStoreBase with _$WindowStore;

abstract class WindowStoreBase with Store {
  final RootStore rootStore;
  final WindowModel window;

  final _minWidth = 200;
  final _minHeight = 200;

  WindowStoreBase(this.rootStore, this.window);

  @observable
  String name = '';

  @action
  void setName(String name) {
    this.name = name;
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
}
