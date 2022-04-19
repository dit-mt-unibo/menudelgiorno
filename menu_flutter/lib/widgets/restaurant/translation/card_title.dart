import 'package:flutter/material.dart';

class RestaurantTranslationCardTitle extends StatelessWidget {
  const RestaurantTranslationCardTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30.0,
        color: Color.fromARGB(255, 147, 19, 19),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
