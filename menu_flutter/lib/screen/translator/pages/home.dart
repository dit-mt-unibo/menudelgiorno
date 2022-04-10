import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/app/user.dart';
import '../../../models/translator/translation_home_dto.dart';
import '../widgets/navbar.dart';
import '../widgets/translation/translation_card_list.dart';

class TranslatorHome extends StatelessWidget {
  const TranslatorHome({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  Future<List<TranslationHomeDto>> _getAllTranslations() async {
    final url = Uri.http('10.0.2.2:8000', '/api/translations');
    final response = await http.get(url);

    List<TranslationHomeDto> translations = [];

    if (response.statusCode != 200) {
      return translations;
    }

    final jsonResponse = jsonDecode(response.body);

    translations = jsonResponse
        .map<TranslationHomeDto>(
            (rawTranslation) => TranslationHomeDto.fromJson(rawTranslation))
        .toList();

    return translations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
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
              if (snapshot.hasData) {
                final translations = snapshot.data as List<TranslationHomeDto>;
                return TranslationCardList(
                  translations: translations,
                  loggedUser: loggedUser,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
      drawer: TranslatorNavbar(
        loggedUser: loggedUser,
      ),
    );
  }
}
