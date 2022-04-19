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
    return Column(
      children: [
        Container(
          height: 620,
          margin: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 10,
          ),
          child: ListView.builder(
            itemCount: translations.length,
            itemBuilder: (context, index) {
              return RestaurantTranslationCard(
                translation: translations[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
