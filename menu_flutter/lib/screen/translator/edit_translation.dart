import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../models/app/user.dart';
import '../../models/translator/translation/edited_translation.dart';
import 'home.dart';
import '../../environment.dart';

class TranslatorEditTranslation extends StatelessWidget {
  TranslatorEditTranslation({
    Key? key,
    required this.currentTranslation,
    required this.loggedUser,
  }) : super(key: key) {
    _translationController.text = currentTranslation.translatedText;
  }

  final EditedTranslation currentTranslation;
  final User loggedUser;

  Future<bool> _updateTranslation(EditedTranslation enteredTranslation) async {
    final url = Uri.http(
      Environment().config.apiHost,
      '/api/translations/${enteredTranslation.translationId}',
    );
    final headers = {'Content-Type': 'application/json'};
    final payload = jsonEncode({
      'text': enteredTranslation.translatedText,
      'user_id': enteredTranslation.userId,
    });
    final response = await http.put(url, headers: headers, body: payload);
    return response.statusCode == 200 ? true : false;
  }

  final _translationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista menus tradotti',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'NotoSerifDisplay',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 6, 54, 188),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Correggi traduzione',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Lancelot',
                    color: Color.fromARGB(255, 6, 54, 188),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: const TextStyle(
                  fontSize: 20,
                ),
                controller: _translationController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Correggi questa traduzione...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(5.0),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    primary: const Color.fromARGB(255, 6, 54, 188),
                  ),
                  onPressed: () async {
                    final enteredTranslation = EditedTranslation(
                      translationId: currentTranslation.translationId,
                      translatedText: _translationController.text,
                      userId: loggedUser.id,
                    );
                    final isUpdateSuccessful =
                        await _updateTranslation(enteredTranslation);
                    if (isUpdateSuccessful) {
                      Fluttertoast.showToast(
                        msg: 'Correzione salvata con successo!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TranslatorHome(
                            loggedUser: loggedUser,
                          ),
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Errore durante il salvataggio!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    }
                  },
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
                        fontSize: 18.0,
                        letterSpacing: 2.0,
                        fontFamily: 'NotoSerifDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
