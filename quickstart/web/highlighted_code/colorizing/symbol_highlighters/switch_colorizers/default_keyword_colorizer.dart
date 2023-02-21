import 'package:flutter/material.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/code_colors.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/switch_colorizers/keyword_with_end_symbol_colorizer.dart';

class DefaultKeywordColorizer extends KeywordWithEndSeparatorColorizer {
  @override
  String get keyword => "default;";

  @override
  Color get keywordColor => CodeColors.conditional;
}
