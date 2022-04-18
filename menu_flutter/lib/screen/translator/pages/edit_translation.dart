import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/app/user.dart';
import '../../../models/translator/translation/edited_translation.dart';
import 'home.dart';

class TranslatorEditTranslation extends StatelessWidget {
  final _translationController = TextEditingController();

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
      '10.0.2.2:8000',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traduzione'),
        backgroundColor: Color.fromARGB(255, 6, 54, 188),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Correggi la traduzione',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Lancelot',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _translationController,
                keyboardType: TextInputType.multiline,
                maxLines: 20,
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
                          builder: (context) =>
                              TranslatorHome(loggedUser: loggedUser),
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
