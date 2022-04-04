import 'package:flutter/material.dart';

import '../../../models/translator/translation_home_dto.dart';
import 'translation.dart';

class TranslationList extends StatelessWidget {
  final List<TranslationHomeDto> translations;

  const TranslationList({
    Key? key,
    required this.translations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ListView.builder(
        itemCount: translations.length,
        itemBuilder: (context, index) {
          return Translation(
            translation: translations[index],
          );
        },
      ),
    );
  }
}
