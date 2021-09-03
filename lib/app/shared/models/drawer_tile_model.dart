import 'package:flutter/material.dart';

class DrawerTileModel {
  final IconData icon;
  final String displayText;
  final void Function() onTap;

  DrawerTileModel({
    required this.icon,
    required this.displayText,
    required this.onTap,
  });
}
