import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:menudelgiorno/screen/ristoratore/widget/language_checkbox_list.dart';
import 'package:menudelgiorno/screen/translator/widgets/language/language_checkbox_list.dart';
import '../../models/app/menu.dart';
import '../../models/translator/language/checked_language_list.dart';
import '../../models/translator/language/matched_language_list.dart';
import 'ristoratore_home.dart';
import '../../models/app/language.dart';
import '../../models/app/user.dart';
import '../../models/translator/language/language_list.dart';

class ScegliLinguaWidget extends StatelessWidget {
  ScegliLinguaWidget({Key? key, required this.loggedUser, required this.menu})
      : super(key: key);
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
      body: FutureBuilder(
        future: _getLanguage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final languages = snapshot.data as LanguageList;
            var matchedLanguages = MatchedLanguageList.fromMatchLanguages(
              languages,
              CheckedLanguageList(
                checkedLanguages: [],
              ),
            );

            return RestaurantLanguageCheckboxList(
              loggedUser: loggedUser,
              matchedLanguageList: matchedLanguages,
              menu : menu,
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
