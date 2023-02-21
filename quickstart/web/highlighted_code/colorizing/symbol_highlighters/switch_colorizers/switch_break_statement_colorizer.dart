import '../../../html_color.dart';
import '../../code_colors.dart';
import 'keyword_with_end_symbol_colorizer.dart';

class SwitchBreakStatementColorizer extends KeywordWithEndSeparatorColorizer {
  @override
  String get keyword => "break;";

  @override
  HTMLColor get keywordColor => CodeColors.conditional;
}
