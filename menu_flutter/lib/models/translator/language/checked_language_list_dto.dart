import 'checked_language_dto.dart';

class CheckedLanguageListDto {
  CheckedLanguageListDto({
    required this.languages,
  });

  List<CheckedLanguageDto> languages;

  static CheckedLanguageListDto fromJson(dynamic obj) {
    final List rawCheckedLanguages = obj as List;

    if (rawCheckedLanguages.isEmpty) {
      return CheckedLanguageListDto(languages: []);
    }

    return CheckedLanguageListDto(
      languages: rawCheckedLanguages.map((rawCheckedLanguage) {
        return CheckedLanguageDto.fromJson(rawCheckedLanguage);
      }).toList(),
    );
  }
}
