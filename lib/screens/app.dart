import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/common/assets.dart';
import 'package:flutter_windows_xp/components/startup_bar/startup_bar.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backgroundImage), fit: BoxFit.cover)),
      ),
      bottomNavigationBar: const StartupBar(),
    );
  }
}
