import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'package:flutter_windows_xp/common/windows_theme.dart';
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
    return MultiProvider(
      providers: [
        Provider(create: (_) => RootStore()),
        Provider.value(value: windowsTheme),
      ],
      child: TapCanvas(
        child: MaterialApp(
          title: 'WinXP - Windows XP in Flutter',
          theme: ThemeData(
            fontFamily: 'Tahoma',
          ),
          home: const App(),
        ),
      ),
    );
  }
}
