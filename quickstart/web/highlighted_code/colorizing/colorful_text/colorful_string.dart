import '../../html_color.dart';

class ColorfulString {
  ColorfulString(this.rawString);
  late final List<HTMLColor> _list = List.filled(rawString.length, HTMLColor('White'));

  HTMLColor getCharColor(int charId) {
    return _list[charId];
  }

  void setCharColor(int charId, HTMLColor color) {
    _list[charId] = color;
  }

  final String rawString;
}
