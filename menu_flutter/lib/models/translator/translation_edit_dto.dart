class TranslationEditDto {
  TranslationEditDto({
    required this.translationId,
    required this.translatedText,
    required this.userId,
  });

  int translationId;
  String translatedText;
  int userId;
}
