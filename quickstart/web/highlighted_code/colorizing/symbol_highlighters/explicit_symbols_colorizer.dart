import '../code_colors.dart';
import '../colorful_text/colorful_string.dart';
import '../colorful_text/colorful_string_in_range_modifier.dart';
import '../colorful_text/substring_finder.dart';
import 'i_symbol_highlighter.dart';

class ExplicitSymbolsColorizer implements ISymbolHighlighter {
  static const _explicitSymbols = ['!', 'not', '?', '??', 'null'];

  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    for (ColorfulString colorString in colorfulStrings) {
      final colorfulStringRangeModifier = ColorfulStringInRangeModifier(colorString);

      for (String symbol in _explicitSymbols) {
        final matches = SubstringFinder.getIndexesOfSubstring(
          symbol,
          colorString.rawString,
        );
        colorfulStringRangeModifier.changeColor(matches, CodeColors.warning);
      }
    }
  }
}
