import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/app/user.dart';
import '../../../models/translator/translation_edit_dto.dart';
import 'home.dart';

class TranslatorTranslationEdit extends StatelessWidget {
  final _translationController = TextEditingController();

  TranslatorTranslationEdit({
    Key? key,
    required this.translation,
    required this.user,
  }) : super(key: key) {
    _translationController.text = translation.translatedText;
  }

  final TranslationEditDto translation;
  final User user;

  Future<bool> _updateTranslation() async {
    final userId = user.id;
    final translationId = translation.translationId;
    final editedText = _translationController.text;

    final url = Uri.http(
      '10.0.2.2:8000',
      '/api/translations/$translationId',
    );

    final payload = {
      'user_id': userId,
      'text': editedText,
    };

    final encodedPayload = jsonEncode(payload);

    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: encodedPayload,
    );

    if (response.statusCode != 200) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traduzione'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
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
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: _translationController,
                keyboardType: TextInputType.multiline,
                maxLines: 22,
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
              ElevatedButton(
                onPressed: () async {
                  final isUpdateSuccessful = await _updateTranslation();
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
                        builder: (context) => TranslatorHome(user: user),
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
            ],
          ),
        ),
      ),
    );
  }
}
