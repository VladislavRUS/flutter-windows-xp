import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/components/window/app_window/app_window.dart';
import 'package:flutter_windows_xp/components/window/window.store.dart';
import 'package:flutter_windows_xp/models/application/window.model.dart';
import 'package:flutter_windows_xp/stores/root.store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
          return AppWindow(
            onUnfocusedTap: windowStore.setFocused,
            focused: widget.window.focused,
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
                Text(
                  windowStore.name,
                  style: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      shadows: const [
                        BoxShadow(color: Colors.black, offset: Offset(1, 1)),
                      ]),
                )
              ],
            ),
            child: widget.window.application.widget,
          );
        },
      ),
    );
  }
}
