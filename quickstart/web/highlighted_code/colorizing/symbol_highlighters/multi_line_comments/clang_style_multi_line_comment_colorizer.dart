import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/code_colors.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/colorful_string.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/i_symbol_highlighter.dart';

class ClangStyleMultiLineCommentColorizer implements ISymbolHighlighter {
  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    bool insideComment = false;
    for (ColorfulString string in colorfulStrings) {
      for (int charId = 0; charId < string.rawString.length; charId++) {
        if (insideComment) {
          string.setCharColor(charId, CodeColors.comment);
        }
        if (string.rawString[charId] == "/") {
          if (charId + 1 < string.rawString.length) {
            // Star after the dash
            if (string.rawString[charId + 1] == '*') {
              insideComment = true;
              string.setCharColor(charId, CodeColors.comment);
            }
          } else if (charId - 1 >= 0) {
            // Star before the dash
            if (string.rawString[charId - 1] == "*") {
              insideComment = false;
            }
          }
        }
      }
    }
  }
}
