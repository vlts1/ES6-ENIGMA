import '../../../html_color.dart';
import '../../colorful_text/colorful_string.dart';
import '../../colorful_text/colorful_string_in_range_modifier.dart';
import '../../colorful_text/ignore_symbols_while_colorizing/i_string_symbol_ignorer.dart';
import '../../colorful_text/ignore_symbols_while_colorizing/string_last_char_ignorer.dart';
import '../../colorful_text/substring_finder.dart';
import '../i_symbol_highlighter.dart';

/// Ignores the last character of the keyword. 

/// Some keywords like break often include a semicolon in the end.
/// For example, the semicolon helps to easily separate the break statement 
/// from the rest of the code, but unlike the break statement semicolon 
/// should not be colorized. 
abstract class KeywordWithEndSeparatorColorizer implements ISymbolHighlighter {
  final IStringSymbolIgnorer _endSeparatorIgnorer = StringLastCharIgnorer();
  
  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    for (ColorfulString colorString in colorfulStrings) {
      final colorfulStringRangeModifier = ColorfulStringInRangeModifier(
        colorString,
      );

      final matches = SubstringFinder.getIndexesOfSubstring(
        keyword,
        colorString.rawString,
      );

      _endSeparatorIgnorer.ignoreSymbolWhileColorizing(matches);
      colorfulStringRangeModifier.changeColor(matches, keywordColor);
    }
  }

  String    get keyword;
  HTMLColor get keywordColor;
}