import '../../../html_color.dart';
import '../../code_colors.dart';
import 'keyword_with_end_symbol_colorizer.dart';

class DefaultKeywordColorizer extends KeywordWithEndSeparatorColorizer {
  @override
  String get keyword => "default;";

  @override
  HTMLColor get keywordColor => CodeColors.conditional;
}
