import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/app/user.dart';
import '../../models/translator/language/checked_language_list.dart';
import '../../models/translator/language/language_list.dart';
import '../../models/translator/language/matched_language_list.dart';
import '../../widgets/restaurant/language/checkbox_list.dart';
import '../../environment.dart';

class ScegliLinguaWidget extends StatelessWidget {
  const ScegliLinguaWidget({
    Key? key,
    required this.loggedUser,
    required this.menuText,
  }) : super(key: key);

  final User loggedUser;
  final String menuText;

  Future<LanguageList> _getLanguage() async {
    final url = Uri.http(Environment().config.apiHost, '/api/languages');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final languages = LanguageList.fromJson(data);
    return languages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scegli lingua'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder(
          future: _getLanguage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final languages = snapshot.data as LanguageList;

              final matchedLanguages = MatchedLanguageList.fromMatchLanguages(
                languages,
                CheckedLanguageList(
                  checkedLanguages: [],
                ),
              );

              return RestaurantLanguageCheckboxList(
                loggedUser: loggedUser,
                matchedLanguageList: matchedLanguages,
                menuText: menuText,
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
