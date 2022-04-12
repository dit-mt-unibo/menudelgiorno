import 'matched_language_list.dart';
import 'updated_language.dart';

class UpdatedLanguageList {
  UpdatedLanguageList({
    required this.updatedLanguages,
  });

  List<UpdatedLanguage> updatedLanguages;

  static List<UpdatedLanguage> _createUpdatedLanguages(
    MatchedLanguageList matchedLanguageList,
  ) {
    return matchedLanguageList.matchedLanguages.map((matchedLanguage) {
      return UpdatedLanguage(
        languageId: matchedLanguage.language.id,
        selected: matchedLanguage.isChecked ? 1 : 0,
      );
    }).toList();
  }

  static UpdatedLanguageList fromMatchedLanguages(
    MatchedLanguageList matchedLanguageList,
  ) {
    return UpdatedLanguageList(
      updatedLanguages: _createUpdatedLanguages(matchedLanguageList),
    );
  }
}
