import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_colorbox/colors_picker/colors_picker.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_colorbox/current_colors/current_colors.dart';

class PaintColorbox extends StatelessWidget {
  const PaintColorbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
      height: 48,
      decoration: const BoxDecoration(
        color: Color(0xffC0C0C0),
        border: Border(
          top: BorderSide(color: Colors.white),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.white,
            ),
            bottom: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CurrentColors(),
            Container(
              width: 1,
              color: Colors.white,
            ),
            const ColorsPicker(),
          ],
        ),
      ),
    );
  }
}
