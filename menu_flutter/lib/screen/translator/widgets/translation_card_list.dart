import 'package:flutter/material.dart';

import '../../../models/translator/translation_home_dto.dart';
import 'translation_card.dart';

class TranslationCardList extends StatelessWidget {
  const TranslationCardList({
    Key? key,
    required this.translations,
  }) : super(key: key);

  final List<TranslationHomeDto> translations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: translations.isEmpty
          ? const SizedBox(
              width: double.infinity,
              child: Text(
                'Nessuna traduzione caricata!',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: translations.length,
              itemBuilder: (context, index) {
                return TranslationCard(
                  translation: translations[index],
                );
              },
            ),
    );
  }
}
