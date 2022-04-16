import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/app/menu.dart';
import '../../../models/app/user.dart';
import '../../../models/translator/language/checked_language_list.dart';
import '../../../models/translator/language/language_list.dart';
import '../../../models/translator/language/matched_language_list.dart';
import '../widgets/language_checkbox_list.dart';

class ScegliLinguaWidget extends StatelessWidget {
  const ScegliLinguaWidget({
    Key? key,
    required this.loggedUser,
    required this.menu,
  }) : super(key: key);

  final User loggedUser;
  final Menu menu;

  Future<LanguageList> _getLanguage() async {
    final url = Uri.http('10.0.2.2:8000', '/api/languages');
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
      body: FutureBuilder(
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
              menu: menu,
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
