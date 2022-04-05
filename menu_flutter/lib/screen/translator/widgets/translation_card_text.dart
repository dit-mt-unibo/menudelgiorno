import 'package:flutter/material.dart';

class TranslationCardText extends StatelessWidget {
  const TranslationCardText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: const TextStyle(
        color: Colors.blueGrey,
        fontSize: 16.0,
      ),
    );
  }
}
