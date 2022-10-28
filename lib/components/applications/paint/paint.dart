import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/applications/paint/paint_body/paint_body.dart';
import 'package:flutter_windows_xp/components/applications/paint/paint_colorbox/paint_colorbox.dart';
import 'package:flutter_windows_xp/components/applications/paint/paint_status_bar/paint_status_bar.dart';
import 'package:flutter_windows_xp/components/applications/paint/paint_toolbox/paint_toolbox.dart';

class Paint extends StatelessWidget {
  const Paint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
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
    );
  }
}
