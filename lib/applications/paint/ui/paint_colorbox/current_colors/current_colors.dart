import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/store/paint.store.dart';
import 'package:flutter_windows_xp/applications/paint/ui/paint_colorbox/current_colors/color_box_current/color_box_current.dart';
import 'package:flutter_windows_xp/common/assets.dart';
import 'package:provider/provider.dart';

import '../color_box_shadow/color_box_shadow.dart';

class CurrentColors extends StatelessWidget {
  const CurrentColors({Key? key}) : super(key: key);

  BoxBorder get _border {
    return const Border(
        left: BorderSide(
          color: Color.fromRGBO(128, 128, 128, 1),
        ),
        top: BorderSide(
          color: Color.fromRGBO(128, 128, 128, 1),
        ),
        right: BorderSide(
          color: Color.fromRGBO(192, 192, 192, 1),
        ),
        bottom: BorderSide(
          color: Color.fromRGBO(192, 192, 192, 1),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final colorsStore = context.read<PaintStore>().colorsStore;

    return GestureDetector(
      onTap: colorsStore.swapColors,
      child: Container(
        width: 32,
        decoration: BoxDecoration(border: _border),
        child: ColorBoxShadow(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(Assets.checker),
              repeat: ImageRepeat.repeat,
            )),
            child: Stack(
              children: [
                Positioned(
                  right: 3,
                  bottom: 3,
                  child: Observer(
                    builder: (_) =>
                        ColorBoxCurrent(color: colorsStore.secondaryColor),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 2,
                  child: Observer(
                    builder: (_) =>
                        ColorBoxCurrent(color: colorsStore.primaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
