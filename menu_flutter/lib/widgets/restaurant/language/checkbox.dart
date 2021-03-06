import 'package:flutter/material.dart';

import '../../../models/app/language.dart';

class RestaurantLanguageCheckbox extends StatelessWidget {
  const RestaurantLanguageCheckbox({
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
            fontSize: 18.0,
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
