import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/app/user.dart';
import '../../../models/translator/translation_home_dto.dart';
import '../widgets/translation_card_list.dart';
import 'navbar.dart';

class TranslatorHome extends StatelessWidget {
  const TranslatorHome({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

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
              if (snapshot.hasData) {
                final translations = snapshot.data as List<TranslationHomeDto>;
                return TranslationCardList(translations: translations);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
      drawer: TranslatorNavbar(
        user: user,
      ),
    );
  }
}
