import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/code_colors.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/i_symbol_highlighter.dart';
import '../../colorful_text/colorful_string.dart';

class CommentColorizer implements ISymbolHighlighter {
  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    for (ColorfulString colorString in colorfulStrings) {
      bool isComment = false;
      for (int colorCharId = 0; colorCharId < colorString.rawString.length; colorCharId++) {
        if (colorString.rawString[colorCharId] == '/') {
          if (colorCharId + 1 < colorString.rawString.length) {
            if (colorString.rawString[colorCharId + 1] == '/') {
              isComment = true;
            }
          }
        }
        if (isComment) {
          colorString.setCharColor(colorCharId, CodeColors.comment);
        }
      }
    }
  }
}
