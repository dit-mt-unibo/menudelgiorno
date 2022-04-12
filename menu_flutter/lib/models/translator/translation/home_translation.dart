class HomeTranslation {
  HomeTranslation({
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

  static HomeTranslation fromJson(dynamic obj) {
    return HomeTranslation(
      translationId: obj['id'],
      restaurantName: obj['menu']['restaurant']['name'],
      translatedText: obj['text'],
      translationLanguageCode: obj['language']['code'],
      elapsedTime: obj['elapsed_time'],
    );
  }
}
