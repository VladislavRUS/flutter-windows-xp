import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/stores/root.store.dart';
import 'package:provider/provider.dart';

class ApplicationsRenderer extends StatelessWidget {
  const ApplicationsRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final applicationsStore = context.read<RootStore>().applicationsStore;

    return Observer(
      builder: (BuildContext context) {
        return Stack(
          children: applicationsStore.openedApplications
              .map((e) => e.widget)
              .toList(),
        );
      },
    );
  }
}
