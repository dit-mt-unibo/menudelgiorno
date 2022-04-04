import '../language.dart';

class TranslationHomeDto {
  TranslationHomeDto({
    required this.id,
    required this.text,
    required this.language,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String text;
  Language language;
  DateTime createdAt;
  DateTime updatedAt;
}
