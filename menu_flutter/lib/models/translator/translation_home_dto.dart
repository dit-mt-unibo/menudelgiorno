class TranslationHomeDto {
  TranslationHomeDto({
    required this.translationId,
    required this.restaurantName,
    required this.translatedText,
    required this.translationLanguageCode,
    required this.elapsedTime,
  });

  int translationId;
  String restaurantName;
  String translatedText;
  String translationLanguageCode;
  String elapsedTime;

  static TranslationHomeDto fromJson(dynamic obj) {
    return TranslationHomeDto(
      translationId: obj['id'],
      restaurantName: obj['menu']['restaurant']['name'],
      translatedText: obj['text'],
      translationLanguageCode: obj['language']['code'],
      elapsedTime: obj['elapsed_time'],
    );
  }
}
