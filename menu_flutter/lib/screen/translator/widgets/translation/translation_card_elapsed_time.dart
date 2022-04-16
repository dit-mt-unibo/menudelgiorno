import 'package:flutter/material.dart';

class TranslationCardElapsedTime extends StatelessWidget {
  const TranslationCardElapsedTime({
    Key? key,
    required this.elapsedTime,
  }) : super(key: key);

  final String elapsedTime;

  @override
  Widget build(BuildContext context) {
    return Text(
      elapsedTime.toUpperCase(),
      style: const TextStyle(
        color: Color.fromARGB(255, 6, 54, 188),
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
