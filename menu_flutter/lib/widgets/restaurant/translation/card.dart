import 'package:flutter/material.dart';

import '../../../models/restaurant/translation.dart';
import 'card_delete_button.dart';
import 'card_qrcode_button.dart';
import 'card_show_button.dart';
import 'card_title.dart';

class RestaurantTranslationCard extends StatelessWidget {
  const RestaurantTranslationCard({
    Key? key,
    required this.translation,
  }) : super(key: key);

  final RestaurantTranslation translation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(113, 179, 169, 169),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: RestaurantTranslationCardTitle(
                title: translation.translatedText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RestaurantTranslationCardShowButton(
                    translationId: translation.translationId,
                  ),
                  RestaurantTranslationCardQrCodeButton(
                    translationId: translation.translationId,
                  ),
                  RestaurantTranslationCardDeleteButton(
                    translationId: translation.translationId,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
