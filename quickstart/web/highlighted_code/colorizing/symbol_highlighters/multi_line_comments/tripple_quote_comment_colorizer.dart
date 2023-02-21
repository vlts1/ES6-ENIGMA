import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/code_colors.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/colorful_string.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/i_symbol_highlighter.dart';

class TrippleQuoteCommentColorizer implements ISymbolHighlighter {
  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    const _singleQuote = '"';
    bool insideComment = false;
    for (ColorfulString string in colorfulStrings) {
      for (int charId = 0; charId < string.rawString.length; charId++) {
        if (string.rawString[charId] == _singleQuote) {
          // Check for overflow
          if (charId + 2 < string.rawString.length) {

            if (string.rawString[charId + 1] == _singleQuote) {
              if (string.rawString[charId + 2] == _singleQuote) {

                insideComment = !insideComment;
                _colorizeTrippleQuoteSymbol(charId, string);
              }
            }
          }
        }
        if (insideComment) {
          string.setCharColor(charId, CodeColors.comment);
        }
      }
    }
  }

  void _colorizeTrippleQuoteSymbol(int startIndex, ColorfulString string) {
    string.setCharColor(startIndex,     CodeColors.comment);
    string.setCharColor(startIndex + 1, CodeColors.comment);
    string.setCharColor(startIndex + 2, CodeColors.comment);
  }
}
