import 'package:flutter_windows_xp/components/custom_menu/menu_descriptors/menu_item_descriptor.dart';

class MenuBarButtonDescriptor {
  final String text;
  final List<MenuItemDescriptor> items;
  final double menuWidth;

  const MenuBarButtonDescriptor({
    required this.text,
    required this.items,
    required this.menuWidth,
  });
}
