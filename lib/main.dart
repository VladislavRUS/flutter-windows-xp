import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'package:flutter_windows_xp/screens/app/app.dart';
import 'stores/root.store.dart';
import 'utils/preload_images.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await preloadImages();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => RootStore(),
      builder: (_, __) => TapCanvas(
        child: MaterialApp(
          title: 'Flutter Windows XP',
          theme: ThemeData(
            fontFamily: 'Montserrat',
          ),
          home: const App(),
        ),
      ),
    );
  }
}
