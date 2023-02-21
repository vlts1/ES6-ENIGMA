import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/string_colorizers/varying_string_colorizer.dart';

/// Doesn't differentiate between C-style chars ('x') and single quote strings
/// ('a string') in higher level languages. Highlights both.
class CharColorizer extends VaryingStringColorizer {
  @override
  String get stringOpeningSymbol => "'";
}
