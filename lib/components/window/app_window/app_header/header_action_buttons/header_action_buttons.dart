import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_windows_xp/common/assets.gen.dart';
import 'package:flutter_windows_xp/components/hovered/hovered.dart';
import 'package:flutter_windows_xp/components/window/window.store.dart';
import 'package:provider/provider.dart';

class HeaderActionButtons extends StatelessWidget {
  const HeaderActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildHideButton(context),
        const SizedBox(
          width: 1,
        ),
        _buildMaximizeButton(context),
        const SizedBox(
          width: 1,
        ),
        _buildCloseButton(context),
      ],
    );
  }

  Widget _buildBaseButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return Hovered(builder: (_, hovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 21,
          height: 21,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: ClipRRect(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  hovered ? Colors.white.withOpacity(0.15) : Colors.transparent,
                  BlendMode.lighten),
              child: child,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildHideButton(BuildContext context) {
    final windowStore = context.read<WindowStore>();

    return _buildBaseButton(
        onTap: windowStore.hide,
        child: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(0.9, 0.9),
                  radius: 1.4,
                  colors: [
                Color.fromRGBO(0, 84, 233, 1),
                Color.fromRGBO(34, 99, 213, 1),
                Color.fromRGBO(68, 121, 228, 1),
                Color.fromRGBO(163, 187, 236, 1),
                Color.fromRGBO(255, 255, 255, 1)
              ],
                  stops: [
                0,
                0.55,
                0.7,
                0.9,
                1
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 3, left: 4),
                height: 3,
                width: 8,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }

  Widget _buildMaximizeButton(BuildContext context) {
    final windowStore = context.read<WindowStore>();

    return _buildBaseButton(
        onTap: windowStore.toggleSize,
        child: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(0.9, 0.9),
                  radius: 1.4,
                  colors: [
                Color.fromRGBO(0, 84, 233, 1),
                Color.fromRGBO(34, 99, 213, 1),
                Color.fromRGBO(68, 121, 228, 1),
                Color.fromRGBO(163, 187, 236, 1),
                Color.fromRGBO(255, 255, 255, 1)
              ],
                  stops: [
                0,
                0.55,
                0.7,
                0.9,
                1
              ])),
          child: Observer(
            builder: (_) {
              return Center(
                child: windowStore.window.maximized
                    ? _buildMinimizeBody()
                    : _buildMaximizeBody(),
              );
            },
          ),
        ));
  }

  Widget _buildMinimizeBody() {
    return Stack(
      children: [
        Positioned(
          left: 7,
          top: 4,
          child: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                border: Border(
              left: BorderSide(color: Colors.white, width: 1),
              bottom: BorderSide(color: Colors.white, width: 1),
              right: BorderSide(color: Colors.white, width: 1),
              top: BorderSide(color: Colors.white, width: 2),
            )),
          ),
        ),
        Positioned(
          left: 4,
          top: 7,
          child: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(19, 109, 255, 1),
                border: Border(
                  left: BorderSide(color: Colors.white, width: 1),
                  bottom: BorderSide(color: Colors.white, width: 1),
                  right: BorderSide(color: Colors.white, width: 1),
                  top: BorderSide(color: Colors.white, width: 2),
                )),
          ),
        )
      ],
    );
  }

  Widget _buildMaximizeBody() {
    return Container(
      height: 12,
      width: 12,
      decoration: const BoxDecoration(
          border: Border(
        left: BorderSide(color: Colors.white, width: 1),
        bottom: BorderSide(color: Colors.white, width: 1),
        right: BorderSide(color: Colors.white, width: 1),
        top: BorderSide(color: Colors.white, width: 3),
      )),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    final windowStore = context.read<WindowStore>();

    return _buildBaseButton(
        onTap: windowStore.close,
        child: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(0.9, 0.9),
                  radius: 1.4,
                  colors: [
                Color.fromRGBO(204, 70, 0, 1),
                Color.fromRGBO(220, 101, 39, 1),
                Color.fromRGBO(205, 117, 70, 1),
                Color.fromRGBO(255, 204, 178, 1),
                Color.fromRGBO(255, 255, 255, 1)
              ],
                  stops: [
                0,
                0.55,
                0.7,
                0.9,
                1
              ])),
          child: Center(
            child: SvgPicture.asset(
              Assets.icons.close,
              color: Colors.white,
              width: 24,
              height: 24,
            ),
          ),
        ));
  }
}
