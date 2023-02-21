import '/ES6-ENIGMA/quickstart/web/highlighted_code/colorizing/colorful_text/substring_finder.dart';

abstract class IStringSymbolIgnorer {
  /// Expects matches from [SubstringFinder].
  void ignoreSymbolWhileColorizing(List<int> substringMatches);
}
