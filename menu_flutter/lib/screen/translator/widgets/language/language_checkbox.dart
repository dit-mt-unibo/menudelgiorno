import 'package:flutter/material.dart';

import '../../../../models/app/language.dart';

class TranslatorLanguageCheckbox extends StatelessWidget {
  const TranslatorLanguageCheckbox({
    Key? key,
    required this.language,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  final Language language;
  final bool isChecked;
  final Function(Language, bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.green,
      title: Text(
        language.name,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
      value: isChecked,
      onChanged: (newValue) {
        onChanged(language, newValue as bool);
      },
    );
  }
}
