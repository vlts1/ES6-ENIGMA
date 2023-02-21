import '../../html_color.dart';
import 'colorful_string.dart';

class ColorfulStringInRangeModifier {
  ColorfulStringInRangeModifier(this.colorfulString);
  final ColorfulString colorfulString;
  
  /// Change color of characters between index pairs of [charIndexPairs]
  void changeColor(List<int> charIndexPairs, HTMLColor color) {
    for (int pairInListLocation = 0; pairInListLocation < charIndexPairs.length; pairInListLocation += 2) {
      
      final charRangeStartIndex = charIndexPairs[pairInListLocation];
      final charRangeEndIndex = charIndexPairs[pairInListLocation + 1];

      for (int stringCharId = charRangeStartIndex; stringCharId < charRangeEndIndex; stringCharId++) {
        colorfulString.setCharColor(stringCharId, color);
      }
    }
  }
}
