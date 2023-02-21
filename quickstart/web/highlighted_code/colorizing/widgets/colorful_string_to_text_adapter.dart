import 'package:flutter/material.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/colorful_text/colorful_string.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorizing/widgets/code_char.dart';

import '../colorful_text/colorful_string.dart';

class ColorfulStringToTextAdapter extends Text {
  ColorfulStringToTextAdapter(ColorfulString string, BuildContext context, {Key? key})
      : super.rich(_colorfulStringToText(string, context), key: key);

  static TextSpan _colorfulStringToText(ColorfulString colorfulString, context) {
    List<CodeChar> colorfulChars = [];

    for (int lineCharId = 0; lineCharId < colorfulString.rawString.length; lineCharId++) {
      colorfulChars.add(
        CodeChar(
          char: colorfulString.rawString[lineCharId],
          charColor: colorfulString.getCharColor(lineCharId),
          context: context,
        ),
      );
    }
    return TextSpan(children: colorfulChars);
  }
}
