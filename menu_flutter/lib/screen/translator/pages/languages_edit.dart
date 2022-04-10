import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/app/user.dart';
import '../../../models/translator/language/checked_language_list_dto.dart';
import '../../../models/translator/language/language_list_dto.dart';
import '../../../models/translator/language/matched_language_list_dto.dart';
import '../widgets/language/language_checkbox_list.dart';

class TranslatorLanguagesEdit extends StatelessWidget {
  const TranslatorLanguagesEdit({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  Future<LanguageListDto> _getLanguages() async {
    final url = Uri.http('10.0.2.2:8000', '/api/languages');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final languages = LanguageListDto.fromJson(data);
    return languages;
  }

  Future<CheckedLanguageListDto> _getUserLanguages(User user) async {
    final url = Uri.http('10.0.2.2:8000', '/api/users/${user.id}/languages');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final checkedLanguages = CheckedLanguageListDto.fromJson(data);
    return checkedLanguages;
  }

  Future<MatchedLanguageListDto> _getMatchedLanguages(User user) async {
    final arr = await Future.wait([_getLanguages(), _getUserLanguages(user)]);
    final languages = arr[0] as LanguageListDto;
    final checkedLanguages = arr[1] as CheckedLanguageListDto;
    return MatchedLanguageListDto.matchLanguages(languages, checkedLanguages);
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
            final matchedLanguagesDto = snapshot.data as MatchedLanguageListDto;
            final matchedLanguages = matchedLanguagesDto.languages;
            return TranslatorLanguageCheckboxList(
              matchedLanguages: matchedLanguages,
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
