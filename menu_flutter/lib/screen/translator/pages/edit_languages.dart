import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/app/user.dart';
import '../../../models/translator/language/checked_language_list.dart';
import '../../../models/translator/language/language_list.dart';
import '../../../models/translator/language/matched_language_list.dart';
import '../widgets/language/language_checkbox_list.dart';

class TranslatorEditLanguages extends StatelessWidget {
  const TranslatorEditLanguages({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  Future<LanguageList> _getLanguages() async {
    final url = Uri.http('10.0.2.2:8000', '/api/languages');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final languageList = LanguageList.fromJson(data);
    return languageList;
  }

  Future<CheckedLanguageList> _getUserLanguages(User user) async {
    final url = Uri.http('10.0.2.2:8000', '/api/users/${user.id}/languages');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final checkedLanguageList = CheckedLanguageList.fromJson(data);
    return checkedLanguageList;
  }

  Future<MatchedLanguageList> _getMatchedLanguages(User user) async {
    final arr = await Future.wait([_getLanguages(), _getUserLanguages(user)]);
    final languageList = arr[0] as LanguageList;
    final checkedLanguageList = arr[1] as CheckedLanguageList;
    return MatchedLanguageList.fromMatchLanguages(
      languageList,
      checkedLanguageList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le mie Lingue'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
      ),
      body: FutureBuilder(
        future: _getMatchedLanguages(loggedUser),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final matchedLanguageList = snapshot.data as MatchedLanguageList;
            return TranslatorLanguageCheckboxList(
              loggedUser: loggedUser,
              matchedLanguageList: matchedLanguageList,
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
