import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeChar extends TextSpan {
  const CodeChar({
    required this.char,
    required this.charColor,
    required this.context,
  });
  final String char;
  final Color charColor;
  final BuildContext context;

  @override
  String? get text => char;

  @override
  TextStyle? get style => GoogleFonts.jetBrainsMono(
        color: charColor,
        fontSize:
            CupertinoTheme.of(context).textTheme.textStyle.fontSize! * 1.10,
      );
}
