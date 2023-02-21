import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/code_colors.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/colorful_string.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/i_symbol_highlighter.dart';

import '../colorful_text/colorful_string_in_range_modifier.dart';
import '../colorful_text/substring_finder.dart';

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
