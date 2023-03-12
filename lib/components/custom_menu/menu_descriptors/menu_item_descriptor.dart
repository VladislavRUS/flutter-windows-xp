import 'package:flutter/material.dart';

class MenuItemDescriptor {}

class MenuItemOptionDescriptor extends MenuItemDescriptor {
  final VoidCallback onTap;

  MenuItemOptionDescriptor({
    required this.onTap,
  });
}

class MenuItemOptionTextDescriptor extends MenuItemOptionDescriptor {
  final String text;

  MenuItemOptionTextDescriptor({
    required this.text,
    required VoidCallback onTap,
  }) : super(onTap: onTap);
}

class MenuItemOptionCheckmarkTextDescriptor extends MenuItemOptionDescriptor {
  final String text;
  final bool checked;

  MenuItemOptionCheckmarkTextDescriptor({
    required this.checked,
    required this.text,
    required VoidCallback onTap,
  }) : super(onTap: onTap);
}

class MenuItemDividerDescriptor extends MenuItemDescriptor {}
