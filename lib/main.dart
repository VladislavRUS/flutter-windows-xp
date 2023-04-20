import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'core/ioc/ioc.dart';
import 'core/theme/windows_theme.dart';
import 'core/utils/preload_images.dart';
import 'ui/screens/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await preloadImages();

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
