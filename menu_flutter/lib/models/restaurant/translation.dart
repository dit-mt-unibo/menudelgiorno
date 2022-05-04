import 'package:intl/intl.dart';

class RestaurantTranslation {
  RestaurantTranslation({
    required this.id,
    required this.text,
    required this.languageCode,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String text;
  String languageCode;
  String createdAt;
  String updatedAt;

  static RestaurantTranslation fromJson(dynamic obj) {
    return RestaurantTranslation(
      id: int.parse(obj['id'].toString()),
      text: obj['text'].toString(),
      languageCode: obj['language']['code'].toString().toUpperCase(),
      createdAt: DateFormat('dd/MM/yyyy HH:mm')
          .format(DateTime.parse(obj['created_at'].toString())),
      updatedAt: DateFormat('dd/MM/yyyy HH:mm')
          .format(DateTime.parse(obj['updated_at'].toString())),
    );
  }
}
