import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/app/user.dart';
import '../../models/translator/language/checked_language_list.dart';
import '../../models/translator/language/language_list.dart';
import '../../models/translator/language/matched_language_list.dart';
import '../../widgets/translator/language/checkbox_list.dart';
import '../../environment.dart';

class TranslatorEditLanguages extends StatelessWidget {
  const TranslatorEditLanguages({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  Future<LanguageList> _getLanguages() async {
    final url = Uri.http(Environment().config.apiHost, '/api/languages');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final languageList = LanguageList.fromJson(data);
    return languageList;
  }

  Future<CheckedLanguageList> _getUserLanguages(User user) async {
    final url = Uri.http(Environment().config.apiHost, '/api/users/${user.id}/languages');
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
        title: const Text(
          'Le mie Lingue',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'NotoSerifDisplay',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 54, 188),
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
      ),
    );
  }
}
