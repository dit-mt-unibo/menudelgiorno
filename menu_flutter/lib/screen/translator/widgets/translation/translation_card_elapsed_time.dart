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
        color: Colors.blue,
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
