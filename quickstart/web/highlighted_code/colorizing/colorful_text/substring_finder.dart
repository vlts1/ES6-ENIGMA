import 'colorful_string_in_range_modifier.dart';

class SubstringFinder {
  /// Returns starting and ending index pairs from matching substrings 
  /// Typically used with [ColorfulStringInRangeModifier].
  static List<int> getIndexesOfSubstring(String substring, String line) {
    List<int> keywordIndexPairs = [];
    String modifiableLine = line;

    if (substring.isEmpty) {
      return [];
    }

    while (true) {
      final matchStartIndex = modifiableLine.indexOf(substring);

      if (matchStartIndex == -1) {
        return keywordIndexPairs;
      }
      final matchEndIndex = matchStartIndex + substring.length;

      keywordIndexPairs.add(matchStartIndex);
      keywordIndexPairs.add(matchEndIndex);

      final keywordPlaceholder = " " * substring.length;
      modifiableLine = 
          modifiableLine.substring(0, matchStartIndex) +
          keywordPlaceholder +
          modifiableLine.substring(matchEndIndex);
    }
  }
}