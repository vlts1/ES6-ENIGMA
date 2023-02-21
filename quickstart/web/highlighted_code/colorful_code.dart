import 'dart:convert';
import 'colorizing/colorful_code_lines_converter.dart';
import 'colorizing/symbol_highlighters/comments/comment_colorizer.dart';
import 'colorizing/symbol_highlighters/comments/python_style_comment_colorizer.dart';
import 'colorizing/symbol_highlighters/explicit_symbols_colorizer.dart';
import 'colorizing/symbol_highlighters/function_colorizer.dart';
import 'colorizing/symbol_highlighters/i_symbol_highlighter.dart';
import 'colorizing/symbol_highlighters/keyword_colorizer.dart';
import 'colorizing/symbol_highlighters/multi_line_comments/clang_style_multi_line_comment_colorizer.dart';
import 'colorizing/symbol_highlighters/multi_line_comments/tripple_quote_comment_colorizer.dart';
import 'colorizing/symbol_highlighters/pascal_case_colorizer.dart';
import 'colorizing/symbol_highlighters/string_colorizers/char_colorizer.dart';
import 'colorizing/symbol_highlighters/string_colorizers/string_colorizer.dart';
import 'colorizing/symbol_highlighters/switch_colorizers/default_keyword_colorizer.dart';
import 'colorizing/symbol_highlighters/switch_colorizers/switch_break_statement_colorizer.dart';
import 'colorizing/widgets/colorful_string_to_text_adapter.dart';

class ColorfulCode extends StatefulWidget {
  const ColorfulCode({required this.code, Key? key}) : super(key: key);
  final String code;
  @override
  State<ColorfulCode> createState() => _ColorfulCodeState();
}

class _ColorfulCodeState extends State<ColorfulCode> {
  static const ls = LineSplitter();
  late final codeLines = ls.convert(widget.code);
  late final colorfulCodeLines = ColorfulCodeLinesCreator.coloredLines(codeLines);
  @override
  void initState() {
    final ISymbolHighlighter  keywordColorizer             = KeywordColorizer();
    final ISymbolHighlighter  pascalCaseColorizer          = PascalCaseColorizer();
    final ISymbolHighlighter  switchDefaultColorizer       = DefaultKeywordColorizer();
    final ISymbolHighlighter  switchBreakColorizer         = SwitchBreakStatementColorizer();
    final ISymbolHighlighter  functionColorizer            = FunctionColorizer();
    final ISymbolHighlighter  explicitSymbolColorizer      = ExplicitSymbolsColorizer();
    final ISymbolHighlighter  charColorizer                = CharColorizer();
    final ISymbolHighlighter  stringColorizer              = StringColorizer();
    final ISymbolHighlighter  pythonStyleCommentColorizer  = PythonStyleCommentColorizer();
    final ISymbolHighlighter  commentColorizer             = CommentColorizer();
    final ISymbolHighlighter  multiLineQuotesCommColorizer = TrippleQuoteCommentColorizer();
    final ISymbolHighlighter  multiLineCommColorizer       = ClangStyleMultiLineCommentColorizer();
    
    pascalCaseColorizer          .highlight(colorfulCodeLines);
    keywordColorizer             .highlight(colorfulCodeLines);
    switchDefaultColorizer       .highlight(colorfulCodeLines);
    switchBreakColorizer         .highlight(colorfulCodeLines);
    functionColorizer            .highlight(colorfulCodeLines);
    explicitSymbolColorizer      .highlight(colorfulCodeLines);
    charColorizer                .highlight(colorfulCodeLines);
    stringColorizer              .highlight(colorfulCodeLines);
    pythonStyleCommentColorizer  .highlight(colorfulCodeLines);
    commentColorizer             .highlight(colorfulCodeLines);
    multiLineCommColorizer       .highlight(colorfulCodeLines);
    multiLineQuotesCommColorizer .highlight(colorfulCodeLines);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return ColorfulStringToTextAdapter(colorfulCodeLines[index], context);
      }),
      itemCount: codeLines.length,
    );
  }
}
