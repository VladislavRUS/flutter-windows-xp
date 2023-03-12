import 'package:flutter/material.dart';

import 'package:flutter_windows_xp/components/custom_menu/menu_descriptors/menu_item_descriptor.dart';
import 'menu_item_divider.dart';
import 'menu_item_option_checkmark_text.dart';
import 'menu_item_option_text.dart';

class MenuItem extends StatelessWidget {
  final MenuItemDescriptor item;
  final double width;

  const MenuItem({
    Key? key,
    required this.item,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    final item = this.item;

    if (item is MenuItemOptionTextDescriptor) {
      return MenuItemOptionText(text: item.text, onTap: item.onTap);
    }

    if (item is MenuItemOptionCheckmarkTextDescriptor) {
      return MenuItemOptionCheckmarkText(
        text: item.text,
        onTap: item.onTap,
        checked: item.checked,
      );
    }

    if (item is MenuItemDividerDescriptor) {
      return const MenuItemDivider();
    }

    return const SizedBox.shrink();
  }
}
