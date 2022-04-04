import 'package:flutter/material.dart';

import '../../../models/translator/translation_home_dto.dart';

class Translation extends StatelessWidget {
  final TranslationHomeDto translation;

  const Translation({
    Key? key,
    required this.translation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              translation.translatedText,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Divider(
              height: 30.0,
              thickness: 1,
              color: Color.fromARGB(150, 26, 85, 247),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translation.translationLanguage.code.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    translation.elapsedTime.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Visualizza',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 3,
    );
  }
}
