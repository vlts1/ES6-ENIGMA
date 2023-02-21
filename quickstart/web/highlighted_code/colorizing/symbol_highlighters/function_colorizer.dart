import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/colorful_string.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/i_symbol_highlighter.dart';
import '../code_colors.dart';

class FunctionColorizer implements ISymbolHighlighter {
  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    for (ColorfulString colorString in colorfulStrings) {
      for (int colorCharId = 0; colorCharId < colorString.rawString.length; colorCharId++) {
        if (colorString.rawString[colorCharId] == '(') {
          _colorizeInLineFunction(colorCharId - 1, colorString);
        }
      }
    }
  }

  void _colorizeInLineFunction(int lastFunctionCharInex, ColorfulString string) {
    for (int charIndex = lastFunctionCharInex; charIndex > -1; charIndex--) {
      // All letters and numbers
      if (!RegExp(r'^[A-Za-z0-9]+$').hasMatch(string.rawString[charIndex])) {
        break;
      }
      string.setCharColor(charIndex, CodeColors.function);
    }
  }
}
