import 'package:flutter/material.dart' hide MenuBar;

import 'package:flutter_windows_xp/components/custom_menu/custom_menu.dart';
import 'package:flutter_windows_xp/components/custom_menu/menu_descriptors/menu_bar_button_descriptor.dart';
import 'package:flutter_windows_xp/components/custom_menu/menu_descriptors/menu_item_descriptor.dart';

class NotepadMenu extends StatelessWidget {
  const NotepadMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomMenu(
      buttons: [
        MenuBarButtonDescriptor(
          text: 'File',
          items: [
            MenuItemOptionTextDescriptor(
              text: 'New',
              onTap: () {},
            ),
            MenuItemDividerDescriptor(),
            MenuItemOptionTextDescriptor(
              text: 'Open...',
              onTap: () {},
            ),
            MenuItemOptionTextDescriptor(
              text: 'Save',
              onTap: () {},
            ),
            MenuItemOptionTextDescriptor(
              text: 'Save as...',
              onTap: () {},
            ),
            MenuItemDividerDescriptor(),
            MenuItemOptionTextDescriptor(
              text: 'Page setup...',
              onTap: () {},
            ),
            MenuItemOptionTextDescriptor(
              text: 'Print...',
              onTap: () {},
            ),
            MenuItemDividerDescriptor(),
            MenuItemOptionTextDescriptor(
              text: 'Exit',
              onTap: () {},
            ),
          ],
          menuWidth: 111,
        ),
        MenuBarButtonDescriptor(
          text: 'Edit',
          items: [
            MenuItemOptionTextDescriptor(text: 'Undo', onTap: () {}),
            MenuItemDividerDescriptor(),
            MenuItemOptionTextDescriptor(text: 'Cut', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'Copy', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'Paste', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'Delete', onTap: () {}),
            MenuItemDividerDescriptor(),
            MenuItemOptionTextDescriptor(text: 'Find...', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'Find next', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'Replace...', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'Go to...', onTap: () {}),
            MenuItemDividerDescriptor(),
            MenuItemOptionTextDescriptor(text: 'Select all', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'Time/Date', onTap: () {}),
          ],
          menuWidth: 98,
        ),
        MenuBarButtonDescriptor(
          text: 'Format',
          items: [
            MenuItemOptionTextDescriptor(text: 'Word wrap', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'Font...', onTap: () {}),
          ],
          menuWidth: 101,
        ),
        MenuBarButtonDescriptor(
          text: 'View',
          items: [
            MenuItemOptionTextDescriptor(text: 'Status Bar', onTap: () {}),
          ],
          menuWidth: 97,
        ),
        MenuBarButtonDescriptor(
          text: 'Help',
          items: [
            MenuItemOptionTextDescriptor(text: 'Help Topics', onTap: () {}),
            MenuItemOptionTextDescriptor(text: 'About Notepad', onTap: () {}),
          ],
          menuWidth: 120,
        )
      ],
    );
  }
}
