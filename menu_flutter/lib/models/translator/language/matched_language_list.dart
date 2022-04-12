import 'checked_language_list.dart';
import 'language_list.dart';
import 'matched_language.dart';

class MatchedLanguageList {
  MatchedLanguageList({
    required this.matchedLanguages,
  });

  final List<MatchedLanguage> matchedLanguages;

  static List<MatchedLanguage> _joinLanguages(
    LanguageList languageList,
    CheckedLanguageList checkedLanguageList,
  ) {
    return languageList.languages.map((language) {
      final matchedLanguageIndex =
          checkedLanguageList.checkedLanguages.indexWhere((checkedLanguage) {
        return checkedLanguage.languageId == language.id;
      });
      return MatchedLanguage(
        language: language,
        isChecked: matchedLanguageIndex > -1
            ? checkedLanguageList.checkedLanguages
                .elementAt(matchedLanguageIndex)
                .selected
            : false,
      );
    }).toList();
  }

  static MatchedLanguageList fromMatchLanguages(
    LanguageList languageList,
    CheckedLanguageList checkedLanguageList,
  ) {
    return MatchedLanguageList(
      matchedLanguages: _joinLanguages(
        languageList,
        checkedLanguageList,
      ),
    );
  }
}
