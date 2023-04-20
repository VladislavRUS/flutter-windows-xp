import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/assets/assets.gen.dart';
import 'package:flutter_windows_xp/ui/screens/app/desktop_renderer/desktop_renderer.dart';
import 'package:flutter_windows_xp/ui/screens/app/windows_renderer/windows_renderer.dart';
import 'package:flutter_windows_xp/ui/widgets/startup_bar/startup_bar.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.background.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: const [
            DesktopRenderer(),
            WindowsRenderer(),
          ],
        ),
        bottomNavigationBar: const StartupBar(),
      ),
    );
  }
}
