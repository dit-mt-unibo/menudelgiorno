import 'checked_language_list_dto.dart';
import 'language_list_dto.dart';
import 'matched_language_dto.dart';

class MatchedLanguageListDto {
  MatchedLanguageListDto({
    required this.languages,
  });

  List<MatchedLanguageDto> languages;

  static MatchedLanguageListDto matchLanguages(
    LanguageListDto languageList,
    CheckedLanguageListDto checkedLanguageList,
  ) {
    return MatchedLanguageListDto(
      languages: languageList.languages.map((language) {
        final matchedLanguageIndex = checkedLanguageList.languages.indexWhere(
            (checkedLanguage) => checkedLanguage.languageId == language.id);
        return MatchedLanguageDto(
          language: language,
          isChecked: matchedLanguageIndex > -1
              ? checkedLanguageList.languages
                  .elementAt(matchedLanguageIndex)
                  .isChecked
              : false,
        );
      }).toList(),
    );
  }
}
