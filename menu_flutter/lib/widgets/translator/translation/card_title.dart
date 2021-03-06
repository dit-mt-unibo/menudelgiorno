import 'package:flutter/material.dart';

class TranslationCardTitle extends StatelessWidget {
  const TranslationCardTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(255, 6, 54, 188),
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'NotoSerifDisplay',
      ),
    );
  }
}
