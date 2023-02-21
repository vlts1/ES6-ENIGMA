import '../../code_colors.dart';
import '../../colorful_text/colorful_string.dart';
import '../i_symbol_highlighter.dart';

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
