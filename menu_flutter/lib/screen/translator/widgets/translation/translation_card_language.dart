import 'package:flutter/material.dart';

class TranslationCardLanguage extends StatelessWidget {
  const TranslationCardLanguage({
    Key? key,
    required this.language,
  }) : super(key: key);

  final String language;

  @override
  Widget build(BuildContext context) {
    return Text(
      language.toUpperCase(),
      style: const TextStyle(
        color: Color.fromARGB(255, 6, 54, 188),
        fontSize: 18.0,
        fontStyle: FontStyle.italic,
        fontFamily: 'Lancelot'
      ),
    );
  }
}
