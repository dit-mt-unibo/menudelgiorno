import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/app/language.dart';
import '../../../models/translator/translation_home_dto.dart';
import '../widgets/translation_list.dart';
import 'navbar.dart';

class TranslatorHome extends StatefulWidget {
  const TranslatorHome({Key? key}) : super(key: key);

  @override
  State<TranslatorHome> createState() => _TranslatorHomeState();
}

class _TranslatorHomeState extends State<TranslatorHome> {
  Future<List<TranslationHomeDto>> _getAllTranslations() async {
    final url = Uri.http('10.0.2.2:8000', '/api/translations');
    final response = await http.get(url);

    // Se la richiesta non è andata a buon fine
    if (response.statusCode != 200) {
      return [];
    }

    // Se la richiesta è andata a buon fine
    // Mappo i dati ricevuti nei modelli

    final jsonResponse = jsonDecode(response.body);

    List<TranslationHomeDto> translations = jsonResponse
        .map<TranslationHomeDto>(
          (rawTranslation) => TranslationHomeDto(
            translationId: rawTranslation['id'],
            translatedText: rawTranslation['text'],
            translationLanguage: Language(
              id: rawTranslation['language']['id'],
              name: rawTranslation['language']['name'],
              code: rawTranslation['language']['code'],
            ),
            elapsedTime: rawTranslation['elapsed_time'],
          ),
        )
        .toList();

    return translations;
  }

  @override
  void initState() {
    super.initState();
    _getAllTranslations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
        elevation: 1,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/download.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(100, 26, 85, 247),
            ),
          ),
          FutureBuilder(
            future: _getAllTranslations(),
            builder: (context, snapshot) {
              // Quando ha completato la Future
              if (snapshot.hasData) {
                final translations = snapshot.data as List<TranslationHomeDto>;
                return TranslationList(translations: translations);
              }
              // Mentre attende il completamento della Future
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
      drawer: const TranslatorNavbar(),
    );
  }
}
