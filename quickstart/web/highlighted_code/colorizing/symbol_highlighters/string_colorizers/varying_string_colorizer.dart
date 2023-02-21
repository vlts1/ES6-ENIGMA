import '../../../html_color.dart';
import '../../code_colors.dart';
import '../../colorful_text/colorful_string.dart';
import '../i_symbol_highlighter.dart';

abstract class VaryingStringColorizer implements ISymbolHighlighter {
  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    for (ColorfulString colorString in colorfulStrings) {
      bool inString = false;
      for (int charId = 0; charId < colorString.rawString.length; charId++) {
        if (inString) {
          colorString.setCharColor(charId, CodeColors.string);
        }
        if (colorString.rawString[charId] == stringOpeningSymbol) {
          colorString.setCharColor(charId, HTMLColor('White'));
          inString = !inString;
        }
      }
    }
  }

  String get stringOpeningSymbol;
}