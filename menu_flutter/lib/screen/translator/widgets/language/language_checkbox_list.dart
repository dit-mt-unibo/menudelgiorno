import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../../models/app/language.dart';
import '../../../../models/app/user.dart';
import '../../../../models/translator/language/matched_language_list.dart';
import '../../../../models/translator/language/updated_language_list.dart';
import 'language_checkbox.dart';

class TranslatorLanguageCheckboxList extends StatefulWidget {
  const TranslatorLanguageCheckboxList({
    Key? key,
    required this.loggedUser,
    required this.matchedLanguageList,
  }) : super(key: key);

  final User loggedUser;
  final MatchedLanguageList matchedLanguageList;

  @override
  State<TranslatorLanguageCheckboxList> createState() =>
      _TranslatorLanguageCheckboxListState();
}

class _TranslatorLanguageCheckboxListState
    extends State<TranslatorLanguageCheckboxList> {
  void updateCheckboxState(Language checkedLanguage, bool checked) {
    setState(() {
      widget.matchedLanguageList.matchedLanguages
          .singleWhere(
              (matchedLanguage) => matchedLanguage.language == checkedLanguage)
          .isChecked = checked;
    });
  }

  Future<bool> _updateLanguages(
    User user,
    MatchedLanguageList matchedLanguageList,
  ) async {
    final url = Uri.http('10.0.2.2:8000', '/api/users/${user.id}/languages');

    final headers = {'Content-Type': 'application/json'};

    final languageListUpdate =
        UpdatedLanguageList.fromMatchedLanguages(matchedLanguageList);

    final payload = jsonEncode({
      'configs': languageListUpdate.updatedLanguages
          .map((updateLanguage) => {
                'language_id': updateLanguage.languageId,
                'selected': updateLanguage.selected,
              })
          .toList()
    });

    final response = await http.post(url, headers: headers, body: payload);

    return response.statusCode == 200 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          SizedBox(
            height: 450,
            child: ListView.builder(
              itemCount: widget.matchedLanguageList.matchedLanguages.length,
              itemBuilder: (context, index) {
                return TranslatorLanguageCheckbox(
                  language: widget
                      .matchedLanguageList.matchedLanguages[index].language,
                  isChecked: widget
                      .matchedLanguageList.matchedLanguages[index].isChecked,
                  onChanged: updateCheckboxState,
                );
              },
            ),
          ),
          Container(
               width: 250,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5.0),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      primary: const Color.fromARGB(255, 6, 54, 188),
                  ),
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  right: 20.0,
                  bottom: 10.0,
                  left: 20.0,
                ),
                child: Text(
                  'Salva',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              onPressed: () async {
                final isUpdateSuccessful = await _updateLanguages(
                  widget.loggedUser,
                  widget.matchedLanguageList,
                );
                if (isUpdateSuccessful) {
                  Fluttertoast.showToast(
                    msg: 'Lingue salvate con successo!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM_RIGHT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: 'Errore durante il salvataggio!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM_RIGHT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
