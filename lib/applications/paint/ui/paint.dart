import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:provider/provider.dart';

import 'paint_body/paint_body.dart';
import 'paint_colorbox/paint_colorbox.dart';
import 'paint_status_bar/paint_status_bar.dart';
import 'paint_toolbox/paint_toolbox.dart';

class Paint extends StatefulWidget {
  const Paint({Key? key}) : super(key: key);

  @override
  State<Paint> createState() => _PaintState();
}

class _PaintState extends State<Paint> {
  late PaintStore _paintStore;

  @override
  void initState() {
    super.initState();

    _paintStore = PaintStore();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _paintStore,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: const [
                  SizedBox(width: 56, child: PaintToolbox()),
                  Expanded(child: PaintBody()),
                ],
              ),
            ),
            const PaintColorbox(),
            const PaintStatusBar(),
          ],
        ),
      ),
    );
  }
}
