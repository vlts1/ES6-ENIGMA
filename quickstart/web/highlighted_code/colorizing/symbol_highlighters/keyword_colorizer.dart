import '../code_colors.dart';
import '../colorful_text/colorful_string.dart';
import '../colorful_text/colorful_string_in_range_modifier.dart';
import '../colorful_text/substring_finder.dart';
import 'i_symbol_highlighter.dart';

class KeywordColorizer implements ISymbolHighlighter {
  static const _conditionals = [
    'if ',
    'elif ',
    'else ',
    'switch ',
    'case ',
    'for ',
    'while ',
    ' in ',
    'return ',
    ' where ', 
  ];
  static const _declarations = [
    'var ',
    'extends ',
    'final ',
    'const ',
    'func ',
    'function ',
    'def ',
    'static ',
    'mutating ',
    'extension ',
    'class ',
    'interface ',
    'enum ',
    'struct ',
    'abstract ',
    'default ',
    'let ',
    'public ',
    'private ',
    'import ',
    'using ',
    'include ',
    'from ',
    'protected ',
    'assert ',
    'namespace ',
    'protocol ',
  ];

  static const _types = [
    'int ',
    'string ',
    'str ',
    'double ',
    'char ',
    'long ',
    'short ',
    'float ',
    'decimal ',
    'void ',
  ];

  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    for (ColorfulString colorString in colorfulStrings) {
      final colorfulStringRangeModifier = ColorfulStringInRangeModifier(colorString);

      for (String conditional in _conditionals) {
        final matches = SubstringFinder.getIndexesOfSubstring(conditional, colorString.rawString);
        colorfulStringRangeModifier.changeColor(matches, CodeColors.conditional);
      }

      for (String declaration in _declarations) {
        final matches = SubstringFinder.getIndexesOfSubstring(declaration, colorString.rawString);
        colorfulStringRangeModifier.changeColor(matches, CodeColors.declaration);
      }

      for (String type in _types) {
        final matches = SubstringFinder.getIndexesOfSubstring(type, colorString.rawString);
        colorfulStringRangeModifier.changeColor(matches, CodeColors.type);
      }
    }
  }
}
