import '../../app/language.dart';

class LanguageListDto {
  LanguageListDto({
    required this.languages,
  });

  List<Language> languages;

  static LanguageListDto fromJson(dynamic obj) {
    final List rawLanguages = obj as List;

    if (rawLanguages.isEmpty) {
      return LanguageListDto(languages: []);
    }

    return LanguageListDto(
      languages: rawLanguages.map((rawLanguage) {
        return Language.fromJson(rawLanguage);
      }).toList(),
    );
  }
}
