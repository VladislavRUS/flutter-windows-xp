import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';

part 'colors.store.g.dart';

class ColorsStore = ColorsStoreBase with _$ColorsStore;

abstract class ColorsStoreBase with Store {
  final PaintStoreBase paintStore;

  ColorsStoreBase(this.paintStore);

  @observable
  Color primaryColor = Colors.black;

  @observable
  Color secondaryColor = Colors.white;

  List<Color> availableColors = const [
    Color.fromRGBO(0, 0, 0, 1),
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(128, 128, 128, 1),
    Color.fromRGBO(192, 192, 192, 1),
    Color.fromRGBO(128, 0, 0, 1),
    Color.fromRGBO(255, 0, 0, 1),
    Color.fromRGBO(128, 128, 0, 1),
    Color.fromRGBO(255, 255, 0, 1),
    Color.fromRGBO(0, 128, 0, 1),
    Color.fromRGBO(0, 255, 0, 1),
    Color.fromRGBO(0, 128, 128, 1),
    Color.fromRGBO(0, 255, 255, 1),
    Color.fromRGBO(0, 0, 128, 1),
    Color.fromRGBO(0, 0, 255, 1),
    Color.fromRGBO(128, 0, 128, 1),
    Color.fromRGBO(255, 0, 255, 1),
    Color.fromRGBO(128, 128, 64, 1),
    Color.fromRGBO(255, 255, 128, 1),
    Color.fromRGBO(0, 64, 64, 1),
    Color.fromRGBO(0, 255, 128, 1),
    Color.fromRGBO(0, 128, 255, 1),
    Color.fromRGBO(128, 255, 128, 1),
    Color.fromRGBO(0, 64, 128, 1),
    Color.fromRGBO(128, 128, 255, 1),
    Color.fromRGBO(64, 0, 255, 1),
    Color.fromRGBO(255, 0, 128, 1),
    Color.fromRGBO(128, 64, 0, 1),
    Color.fromRGBO(255, 128, 64, 1),
  ];

  @action
  void setPrimaryColor(Color color) {
    primaryColor = color;
  }

  @action
  void setSecondaryColor(Color color) {
    secondaryColor = color;
  }

  @action
  void swapColors() {
    final tmp = secondaryColor;

    secondaryColor = primaryColor;
    primaryColor = tmp;
  }
}
