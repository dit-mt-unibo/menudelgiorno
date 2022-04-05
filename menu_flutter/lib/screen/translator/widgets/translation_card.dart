import 'package:flutter/material.dart';

import '../../../models/translator/translation_home_dto.dart';
import 'translation_card_elapsed_time.dart';
import 'translation_card_language.dart';
import 'translation_card_text.dart';
import 'translation_card_title.dart';

class TranslationCard extends StatelessWidget {
  const TranslationCard({
    Key? key,
    required this.translation,
  }) : super(key: key);

  final TranslationHomeDto translation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TranslationCardTitle(
                title: translation.restaurantName,
              ),
            ),
            TranslationCardText(
              text: translation.translatedText,
            ),
            const Divider(
              height: 30.0,
              thickness: 1,
              color: Color.fromARGB(255, 26, 85, 247),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TranslationCardLanguage(
                    language: translation.translationLanguageCode,
                  ),
                  TranslationCardElapsedTime(
                    elapsedTime: translation.elapsedTime,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Traduci',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 3,
    );
  }
}
