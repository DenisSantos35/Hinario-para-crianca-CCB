import 'package:flutter/material.dart';

class IconButtom {
  static IconButton bottomIcon(
      {required IconData icon,
      required VoidCallback function,
      required Color colors,
      required double size}) {
    return IconButton(
      icon: Icon(
        icon,
        color: colors,
        size: size,
      ),
      onPressed: function,
    );
  }
}
