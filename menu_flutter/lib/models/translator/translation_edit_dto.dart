import 'translation_home_dto.dart';

class TranslationEditDto {
  TranslationEditDto({
    required this.translationId,
    required this.translatedText,
  });

  int translationId;
  String translatedText;

  static TranslationEditDto fromTranslationHomeDto(
    TranslationHomeDto translationHomeDto,
  ) {
    return TranslationEditDto(
      translationId: translationHomeDto.translationId,
      translatedText: translationHomeDto.translatedText,
    );
  }
}
