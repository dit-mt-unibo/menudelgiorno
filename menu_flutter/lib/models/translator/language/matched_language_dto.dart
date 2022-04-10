import '../../app/language.dart';

class MatchedLanguageDto {
  MatchedLanguageDto({
    required this.language,
    required this.isChecked,
  });

  Language language;
  bool isChecked;
}
