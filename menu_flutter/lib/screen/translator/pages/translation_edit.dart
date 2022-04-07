import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/translator/translation_edit_dto.dart';

class TranslatorTranslationEdit extends StatelessWidget {
  final _translationController = TextEditingController();

  TranslatorTranslationEdit({
    Key? key,
    required this.translation,
  }) : super(key: key) {
    _translationController.text = translation.translatedText;
  }

  final TranslationEditDto translation;

  Future<bool> _updateTranslation() async {
    // final translationId = translation.translationId;
    // final url = Uri.http('10.0.2.2:8000', '/api/translations/$translationId');
    // final payload = {'text': translation.translatedText};
    // final encodedPayload = jsonEncode(payload);
    // final response = await http.put(url, body: payload);
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
                  hintText: 'Correggi la traduzione...',
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
                  final updateSuccessfully = await _updateTranslation();
                  print(updateSuccessfully);
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
                      fontSize: 25.0,
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
