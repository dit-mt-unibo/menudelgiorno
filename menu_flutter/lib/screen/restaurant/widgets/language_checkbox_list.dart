import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../models/app/language.dart';
import '../../../models/app/user.dart';
import '../../../models/translator/language/matched_language_list.dart';
import '../pages/ristoratore_home.dart';
import 'language_checkbox.dart';

class RestaurantLanguageCheckboxList extends StatefulWidget {
  const RestaurantLanguageCheckboxList({
    Key? key,
    required this.loggedUser,
    required this.menuText,
    required this.matchedLanguageList,
  }) : super(key: key);

  final User loggedUser;
  final String menuText;
  final MatchedLanguageList matchedLanguageList;

  @override
  State<RestaurantLanguageCheckboxList> createState() =>
      _RestaurantLanguageCheckboxListState();
}

class _RestaurantLanguageCheckboxListState
    extends State<RestaurantLanguageCheckboxList> {
  Future<bool> _createMenu(
    User user,
    String menuText,
    List<int> languageIds,
  ) async {
    final url = Uri.http('10.0.2.2:8000', '/api/menus');

    final headers = {'Content-Type': 'application/json'};

    final payload = jsonEncode({
      "text": menuText,
      "user_id": user.id,
      "language_idArray": languageIds,
    });

    final response = await http.post(url, headers: headers, body: payload);

    return response.statusCode == 200 ? true : false;
  }

  void updateCheckboxState(Language checkedLanguage, bool checked) {
    setState(() {
      widget.matchedLanguageList.matchedLanguages
          .singleWhere(
              (matchedLanguage) => matchedLanguage.language == checkedLanguage)
          .isChecked = checked;
    });
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
                return RestaurantLanguageCheckbox(
                  language: widget
                      .matchedLanguageList.matchedLanguages[index].language,
                  isChecked: widget
                      .matchedLanguageList.matchedLanguages[index].isChecked,
                  onChanged: updateCheckboxState,
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                primary: const Color.fromARGB(255, 147, 19, 19),
              ),
              child: const Text(
                'Salva',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onPressed: () async {
                final languageIds = widget.matchedLanguageList.matchedLanguages
                    .where(
                      (matchedLanguage) => matchedLanguage.isChecked,
                    )
                    .map(
                      (matchedLanguage) => matchedLanguage.language.id,
                    )
                    .toList();

                final isCreateSuccessful = await _createMenu(
                  widget.loggedUser,
                  widget.menuText,
                  languageIds,
                );
                if (isCreateSuccessful) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RistoratoreHome(
                        loggedUser: widget.loggedUser,
                      ),
                    ),
                  );
                  Fluttertoast.showToast(
                    msg: 'Menu salvato con successo!',
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
