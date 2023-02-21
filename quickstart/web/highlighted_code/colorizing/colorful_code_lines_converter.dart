import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/colorful_string.dart';

class ColorfulCodeLinesCreator {
 static List<ColorfulString> coloredLines(List<String> codeLines) {
    List<ColorfulString> colored = [];
    for (String line in codeLines) {
      colored.add(ColorfulString(line));
    }
    return colored;
  }
}
