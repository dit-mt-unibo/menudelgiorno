import 'package:flutter/material.dart';

import '../../../models/restaurant/translation.dart';
import 'card.dart';

class RestaurantTranslationCardList extends StatelessWidget {
  const RestaurantTranslationCardList({
    Key? key,
    required this.translations,
  }) : super(key: key);

  final List<RestaurantTranslation> translations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 620,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: translations.isEmpty
            ? const SizedBox(
                width: double.infinity,
                child: Text(
                  'Nessuna traduzione disponibile!',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: translations.length,
                itemBuilder: (context, index) {
                  return RestaurantTranslationCard(
                    translation: translations[index],
                  );
                },
              ),
      ),
    );
  }
}
