import '../app/language.dart';

class TranslationHomeDto {
  TranslationHomeDto({
    required this.translationId,
    required this.translatedText,
    required this.translationLanguage,
    required this.elapsedTime,
  });

  int translationId;
  String translatedText;
  Language translationLanguage;
  String elapsedTime;
}
