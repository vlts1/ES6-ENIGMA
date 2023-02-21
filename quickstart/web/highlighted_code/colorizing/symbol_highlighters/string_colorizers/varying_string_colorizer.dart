import 'package:flutter/material.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/code_colors.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/colorful_string.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/symbol_highlighters/i_symbol_highlighter.dart';

abstract class VaryingStringColorizer implements ISymbolHighlighter {
  @override
  void highlight(List<ColorfulString> colorfulStrings) {
    for (ColorfulString colorString in colorfulStrings) {
      bool inString = false;
      for (int charId = 0; charId < colorString.rawString.length; charId++) {
        if (inString) {
          colorString.setCharColor(charId, CodeColors.string);
        }
        if (colorString.rawString[charId] == stringOpeningSymbol) {
          colorString.setCharColor(charId, Colors.white);
          inString = !inString;
        }
      }
    }
  }

  String get stringOpeningSymbol;
}
