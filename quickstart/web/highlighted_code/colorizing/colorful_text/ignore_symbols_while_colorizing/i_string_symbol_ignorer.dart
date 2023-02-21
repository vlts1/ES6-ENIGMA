import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/substring_finder.dart';

abstract class IStringSymbolIgnorer {
  /// Expects matches from [SubstringFinder].
  void ignoreSymbolWhileColorizing(List<int> substringMatches);
}
