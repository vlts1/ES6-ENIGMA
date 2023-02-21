import 'package:flutter/material.dart';

class ColorfulString {
  ColorfulString(this.rawString);
  late final List<Color> _list = List.filled(rawString.length, Colors.white);

  Color getCharColor(int charId) {
    return _list[charId];
  }

  void setCharColor(int charId, Color color) {
    _list[charId] = color;
  }

  final String rawString;
}
