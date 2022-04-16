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
      title: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          right: 20.0,
          bottom: 10.0,
          left: 20.0,
        ),
        child: Text(
          language.name,
          style: const TextStyle(
            fontSize: 28.0,
            fontFamily: 'Lancelot'
          ),
        ),
      ),
      value: isChecked,
      onChanged: (newValue) {
        onChanged(
          language,
          newValue as bool,
        );
      },
    );
  }
}
