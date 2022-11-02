import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_colorbox/colors_picker/color_box/color_box.dart';
import 'package:provider/provider.dart';

class ColorsPicker extends StatelessWidget {
  const ColorsPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsStore = context.read<PaintStore>().colorsStore;

    return Container(
      color: Colors.white,
      child: GridView.count(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        children: colorsStore.availableColors
            .map(
              (e) => ColorBox(
                color: e,
                onTap: colorsStore.setPrimaryColor,
                onSecondaryTap: colorsStore.setSecondaryColor,
              ),
            )
            .toList(),
      ),
    );
  }
}
