import '../../app/language.dart';

class LanguageList {
  LanguageList({
    required this.languages,
  });

  List<Language> languages;

  static LanguageList fromJson(dynamic obj) {
    final List rawLanguages = obj as List;

    if (rawLanguages.isEmpty) {
      return LanguageList(languages: []);
    }

    return LanguageList(
      languages: rawLanguages.map((rawLanguage) {
        return Language.fromJson(rawLanguage);
      }).toList(),
    );
  }
}
