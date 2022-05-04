class Language {
  Language({
    required this.id,
    required this.name,
    required this.code,
  });

  int id;
  String name;
  String code;

  static Language fromJson(dynamic obj) {
    return Language(
      id: obj['id'],
      name: obj['name'],
      code: obj['code'],
    );
  }
}
