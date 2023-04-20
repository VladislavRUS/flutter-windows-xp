import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/core/theme/windows_theme.dart';
import 'package:flutter_windows_xp/ui/widgets/hovered/hovered.dart';
import 'menu_descriptors/menu_bar_button_descriptor.dart';
import 'menu_item/menu_item.dart';

class CustomMenu extends StatefulWidget {
  final List<MenuBarButtonDescriptor> buttons;

  const CustomMenu({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  ShortcutRegistryEntry? _shortcutsEntry;

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customMenuTheme = WindowsTheme.of(context).customMenuTheme;

    return Container(
      color: customMenuTheme.menuBackground,
      alignment: Alignment.centerLeft,
      child: MenuBar(
        style: MenuStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          backgroundColor:
              MaterialStatePropertyAll(customMenuTheme.menuBackground),
          fixedSize: const MaterialStatePropertyAll(
            Size.fromHeight(20),
          ),
        ),
        children: widget.buttons
            .map(
              (button) => Hovered(
                builder: (context, hovered) {
                  final text = button.text;
                  final textStyle = TextStyle(
                    color: hovered
                        ? customMenuTheme.menuItemHoveredText
                        : customMenuTheme.menuItemText,
                    fontSize: 11,
                  );

                  final size = (TextPainter(
                    text: TextSpan(text: text, style: textStyle),
                    maxLines: 1,
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    textDirection: TextDirection.ltr,
                  )..layout())
                      .size;

                  return SizedBox(
                    width: size.width + 14,
                    child: SubmenuButton(
                      alignmentOffset: const Offset(0, -10),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 7),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          hovered
                              ? customMenuTheme.menuBarButtonHoveredBackground
                              : customMenuTheme.menuBarButtonBackground,
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      menuStyle: MenuStyle(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(3)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: customMenuTheme.menuBorder,
                            width: 1,
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(8),
                      ),
                      menuChildren: button.items
                          .map(
                            (item) => MenuItem(
                              width: button.menuWidth,
                              item: item,
                            ),
                          )
                          .toList(),
                      child: Text(
                        text,
                        style: textStyle,
                      ),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
