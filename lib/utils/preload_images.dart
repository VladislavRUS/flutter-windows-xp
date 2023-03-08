import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:flutter_windows_xp/common/assets.gen.dart';

Future<void> preloadImages() async {
  final images = [
    Assets.apps.minesweeper.minesweeper,
    ...Assets.apps.minesweeper.digits.values,
    ...Assets.apps.minesweeper.field.values,
    ...Assets.apps.minesweeper.face.values,
    Assets.apps.notepad.notepad,
    ...Assets.apps.paint.values,
    Assets.icons.device,
    Assets.icons.protection,
    Assets.icons.sound,
    ...Assets.images.values,
    ...Assets.images.values,
  ];

  await Future.wait(images.map((image) => _preloadImage(image.path)));
}

Future<void> _preloadImage(String asset) async {
  final imageStream = AssetImage(asset).resolve(ImageConfiguration.empty);

  final completer = Completer<dynamic>();

  final listener = ImageStreamListener(
    (ImageInfo imageInfo, bool synchronousCall) => completer.complete(),
    onError: (e, stackTrace) => completer.completeError(e, stackTrace),
  );

  imageStream.addListener(listener);

  return completer.future
      .whenComplete(() => imageStream.removeListener(listener));
}
