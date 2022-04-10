class CheckedLanguageDto {
  CheckedLanguageDto({
    required this.languageId,
    required this.isChecked,
  });

  int languageId;
  bool isChecked;

  static CheckedLanguageDto fromJson(dynamic obj) {
    return CheckedLanguageDto(
      languageId: obj['language_id'],
      isChecked: obj['selected'] == 1 ? true : false,
    );
  }
}
