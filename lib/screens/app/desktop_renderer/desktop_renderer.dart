import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/stores/root.store.dart';
import 'app_icon.dart';

class DesktopRenderer extends StatelessWidget {
  const DesktopRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final applicationsStore = context.read<RootStore>().applicationsStore;

    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        itemBuilder: (_, index) => Row(
          children: [
            SizedBox(
              width: 100,
              height: 60,
              child: Center(
                child: AppIcon(
                  application: applicationsStore.applications[index],
                ),
              ),
            ),
          ],
        ),
        separatorBuilder: (_, __) => const SizedBox(
          height: 20,
        ),
        itemCount: applicationsStore.applications.length,
      ),
    );
  }
}
