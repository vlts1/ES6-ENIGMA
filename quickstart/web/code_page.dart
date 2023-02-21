import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruzz/pages/home_page/code_page/highlighted_code/colorful_code.dart';
import 'navigation/code_page_top_navigation.dart';

class CodePage extends StatefulWidget {
  const CodePage({this.code, Key? key}) : super(key: key);
  final String? code;
  static const route = '/code';
  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _codeExampleTODO = """

/// SAMPLE CODE ///
extension Collection where Element == Player {
    // Returns the highest score of all the players,
    // or `nil` if the collection is empty.
    func highestScoringPlayer() -> Player? {
        return self.max(by: { \$0.highScore < \$1.highScore })
    }
}

if let bestPlayer = players.highestScoringPlayer() {
    recordHolder = \"""
        The record holder is (bestPlayer.name),
        with a high score of (bestPlayer.highScore)!
        \"""
} else {
    recordHolder = "No games have been played yet."
}
print(recordHolder)
// The record holder is Erin, with a high score of 271!

let highestScore = players.highestScoringPlayer()?.highScore ?? 0
// highestScore == 271
player.updateScore(50)
// Prints "50! A new high score for Tomas! 🎉"
// player.highScore == 50
player.updateScore(50)
// Prints "50! A new high score for Tomas! 🎉"
// player.highScore == 50
  import java.math.BigInteger

  def factorial(x: BigInteger): BigInteger =
    if (x == BigInteger.ZERO)
      BigInteger.ONE 
    else
      x.multiply(factorial(x.subtract(BigInteger.ONE)))


program HelloWorld;
uses crt;

(* Here the main program block starts *)
begin
   writeln('Hello, World!');
   readkey;
end. 

""";
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );

    return WillPopScope(
      // Don't go to the back page on swipe
      onWillPop: () async => false,
      child: CupertinoPageScaffold(
        // TODO
        //navigationBar: CodeInsetTopNavigation(widget.code!),
        navigationBar: CodePageTopNavigation(
          _codeExampleTODO,
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          right: false,
          child: RawScrollbar(
            radius: const Radius.circular(2),
            thumbColor: Colors.grey,
            thickness: 5,
            child: ColorfulCode(code: _codeExampleTODO),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 30),
      ),
    );
  }
}
