import 'i_string_symbol_ignorer.dart';

/// Some code symbols always end with a special character,
/// which makes it easy to separate them from the rest. For example
/// in most languages the "break" statement ends with a semicolon.

/// I look for breaks in code with this semicolon, but unlike the "break"
/// itself, I do not want to colorize the semicolon.

/// This class removes the last character from all matches.

class StringLastCharIgnorer implements IStringSymbolIgnorer {

  @override
  void ignoreSymbolWhileColorizing(List<int> substringMatches) {
    for (int matchEnd = 1; matchEnd < substringMatches.length; matchEnd += 2) {
      substringMatches[matchEnd]--;
    }
  }
}
