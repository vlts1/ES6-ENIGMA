import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/code_colors.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/colorful_string.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/i_symbol_highlighter.dart';

class PascalCaseColorizer implements ISymbolHighlighter {
  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    for (ColorfulString colorString in colorfulStrings) {
      for (int colorCharId = 1; colorCharId < colorString.rawString.length; colorCharId++) {
        // Uppercase letters
        if (RegExp(r'^[A-Z]+$').hasMatch(colorString.rawString[colorCharId])) {
          // All letters and numbers
          if (!RegExp(r'^[A-Za-z0-9]+$').hasMatch(colorString.rawString[colorCharId - 1]) ) {
            _colorizePascalCase(colorCharId, colorString);
          }
        }
      }
    }
  }

  void _colorizePascalCase(int firstCharIndex, ColorfulString string) {
    for (int charIndex = firstCharIndex; charIndex < string.rawString.length; charIndex++) {
      // All letters and numbers
      if (!RegExp(r'^[A-Za-z0-9]+$').hasMatch(string.rawString[charIndex])) {
        break;
      }
      string.setCharColor(charIndex, CodeColors.pascalCase);
    }
  }
}