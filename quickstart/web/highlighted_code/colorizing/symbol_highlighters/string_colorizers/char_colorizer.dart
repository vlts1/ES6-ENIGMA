import 'varying_string_colorizer.dart';

/// Doesn't differentiate between C-style chars ('x') and single quote strings
/// ('a string') in higher level languages. Highlights both.
class CharColorizer extends VaryingStringColorizer {
  @override
  String get stringOpeningSymbol => "'";
}
