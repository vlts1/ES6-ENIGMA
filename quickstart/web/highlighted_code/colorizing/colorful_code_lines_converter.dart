import 'colorful_text/colorful_string.dart';

class ColorfulCodeLinesCreator {
 static List<ColorfulString> coloredLines(List<String> codeLines) {
    List<ColorfulString> colored = [];
    for (String line in codeLines) {
      colored.add(ColorfulString(line));
    }
    return colored;
  }
}
