import 'package:flutter/material.dart';

class RestaurantTranslationCardDeleteButton extends StatelessWidget {
  const RestaurantTranslationCardDeleteButton({
    Key? key,
    required this.translationId,
  }) : super(key: key);

  final int translationId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        primary: const Color.fromARGB(255, 147, 19, 19),
      ),
      child: const Text(
        'ELIMINA',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      onPressed: () {},
    );
  }
}
