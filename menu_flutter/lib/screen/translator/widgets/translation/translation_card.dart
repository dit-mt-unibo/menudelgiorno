import 'package:flutter/material.dart';

import '../../../../models/app/user.dart';
import '../../../../models/translator/translation/edited_translation.dart';
import '../../../../models/translator/translation/home_translation.dart';
import '../../pages/edit_translation.dart';
import 'translation_card_elapsed_time.dart';
import 'translation_card_language.dart';
import 'translation_card_text.dart';
import 'translation_card_title.dart';

class TranslationCard extends StatelessWidget {
  const TranslationCard({
    Key? key,
    required this.currentTranslation,
    required this.loggedUser,
  }) : super(key: key);

  final HomeTranslation currentTranslation;
  final User loggedUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TranslationCardTitle(
                title: currentTranslation.restaurantName,
              ),
            ),
            TranslationCardText(
              text: currentTranslation.translatedText,
            ),
            const Divider(
              height: 30.0,
              thickness: 1,
              color: Color.fromARGB(255, 6, 54, 188),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TranslationCardLanguage(
                    language: currentTranslation.translationLanguageCode,
                  ),
                  TranslationCardElapsedTime(
                    elapsedTime: currentTranslation.elapsedTime,
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(5.0),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      primary: const Color.fromARGB(255, 6, 54, 188), 
                          ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TranslatorEditTranslation(
                        currentTranslation: EditedTranslation(
                          translationId: currentTranslation.translationId,
                          translatedText: currentTranslation.translatedText,
                          userId: loggedUser.id,
                        ),
                        loggedUser: loggedUser,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Visualizza',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.5,
                    fontFamily: 'NotoSerifDisplay'
                  ),
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
