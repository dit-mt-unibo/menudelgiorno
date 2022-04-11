import 'checked_language.dart';

class CheckedLanguageList {
  CheckedLanguageList({
    required this.checkedLanguages,
  });

  List<CheckedLanguage> checkedLanguages;

  static CheckedLanguageList fromJson(dynamic obj) {
    final List rawCheckedLanguageList = obj as List;

    if (rawCheckedLanguageList.isEmpty) {
      return CheckedLanguageList(checkedLanguages: []);
    }

    return CheckedLanguageList(
      checkedLanguages: rawCheckedLanguageList.map((rawCheckedLanguage) {
        return CheckedLanguage.fromJson(rawCheckedLanguage);
      }).toList(),
    );
  }
}
