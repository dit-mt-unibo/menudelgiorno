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
        color: Colors.blue,
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
