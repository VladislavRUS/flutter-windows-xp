import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'package:flutter_windows_xp/screens/app/app.dart';
import 'stores/root.store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => RootStore(),
      builder: (_, __) => const TapCanvas(
        child: MaterialApp(
          title: 'Flutter Windows XP',
          debugShowCheckedModeBanner: false,
          home: App(),
        ),
      ),
    );
  }
}
