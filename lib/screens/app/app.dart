import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/common/assets.dart';
import 'package:flutter_windows_xp/components/startup_bar/startup_bar.dart';
import 'package:flutter_windows_xp/screens/app/applications_renderer/applications_renderer.dart';
import 'package:flutter_windows_xp/screens/app/desktop_renderer/desktop_renderer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.backgroundImage), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: const [
            Positioned.fill(
              child: DesktopRenderer(),
            ),
            Positioned.fill(
              child: ApplicationsRenderer(),
            ),
          ],
        ),
        bottomNavigationBar: const StartupBar(),
      ),
    );
  }
}
