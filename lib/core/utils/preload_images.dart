import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';

Future<void> preloadImages() async {
  final images = [
    // Minesweeper
    Assets.applications.minesweeper.minesweeper,
    ...Assets.applications.minesweeper.digits.values,
    ...Assets.applications.minesweeper.field.values,
    ...Assets.applications.minesweeper.face.values,
    // Notepad
    Assets.applications.notepad.notepad,
    // Paint
    ...Assets.applications.paint.values,
    // Winamp
    ...Assets.applications.winamp.ui.values,
    Assets.applications.winamp.winamp,
    // Other
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
