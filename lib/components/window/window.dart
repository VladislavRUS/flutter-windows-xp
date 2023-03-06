import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tap_canvas/tap_canvas.dart';

import 'package:flutter_windows_xp/common/constants.dart';
import 'package:flutter_windows_xp/components/window/app_window/app_window.dart';
import 'package:flutter_windows_xp/components/window/resizable/resizable.dart';
import 'package:flutter_windows_xp/components/window/window.store.dart';
import 'package:flutter_windows_xp/models/window/window.model.dart';
import 'package:flutter_windows_xp/stores/root.store.dart';

class Window extends StatefulWidget {
  final WindowModel window;

  const Window({
    Key? key,
    required this.window,
  }) : super(key: key);

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  late WindowStore windowStore;

  @override
  void initState() {
    super.initState();

    final rootStore = context.read<RootStore>();

    windowStore = WindowStore(rootStore, widget.window);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: windowStore,
      child: Observer(
        builder: (_) {
          return Positioned(
            left: windowStore.window.left,
            top: windowStore.window.top,
            width: windowStore.window.maximized
                ? MediaQuery.of(context).size.width
                : windowStore.window.width,
            height: windowStore.window.maximized
                ? MediaQuery.of(context).size.height - Constants.bottomBarHeight
                : windowStore.window.height,
            child: GestureDetector(
              onPanDown: windowStore.window.focused
                  ? null
                  : (_) => windowStore.setFocused(),
              child: Resizable(
                onDragTopLeftCorner: windowStore.onDragTopLeftCorner,
                onDragTopRightCorner: windowStore.onDragTopRightCorner,
                onDragBottomRightCorner: windowStore.onDragBottomRightCorner,
                onDragBottomLeftCorner: windowStore.onDragBottomLeftCorner,
                child: TapOutsideDetectorWidget(
                  onTappedOutside: () {
                    if (windowStore.window.focused) {
                      windowStore.unfocus();
                    }
                  },
                  child: AppWindow(
                    onDragUpdate: windowStore.onDragUpdate,
                    focused: windowStore.window.focused,
                    header: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          widget.window.application.icon,
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            windowStore.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.notoSans(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              shadows: const [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    child: widget.window.application.widget,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
