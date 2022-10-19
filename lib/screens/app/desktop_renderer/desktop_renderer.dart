import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/stores/root.store.dart';
import 'package:provider/provider.dart';

import 'app_icon.dart';

class DesktopRenderer extends StatelessWidget {
  const DesktopRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final applicationsStore = context.read<RootStore>().applicationsStore;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Observer(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: applicationsStore.applications
              .map((application) => AppIcon(
                    application: application,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
