class CheckedLanguage {
  CheckedLanguage({
    required this.languageId,
    required this.selected,
  });

  int languageId;
  bool selected;

  static CheckedLanguage fromJson(dynamic obj) {
    return CheckedLanguage(
      languageId: obj['language_id'],
      selected: obj['selected'] == 1 ? true : false,
    );
  }
}
