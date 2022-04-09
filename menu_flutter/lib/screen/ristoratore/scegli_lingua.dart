import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ristoratore_home.dart';
import '../../models/app/language.dart';

class ScegliLinguaWidget extends StatefulWidget {
  const ScegliLinguaWidget({Key? key}): super(key: key);


  @override
  State<ScegliLinguaWidget> createState() => _ScegliLinguaWidgetState();
}

class _ScegliLinguaWidgetState extends State<ScegliLinguaWidget> {
  
  Future<Language> _getLanguage() async {
    final url = Uri.http('10.0.2.2:8000', '/api/languages/');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final languages = Language.fromJson(data);
    print(languages);
    return languages;
  }

  bool italiano = false;
  bool inglese = false;
  bool francese = false;
  bool tedesco = false;
  bool spagnolo = false;
  bool portoghese = false;
  bool cinese = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getLanguage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final language = snapshot.data as Language;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Seleziona una o più lingue',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                CheckboxListTile(
                  value: inglese,
                  onChanged: (val) {
                    setState(() {
                      inglese = val as bool;
                    });
                  },
                  activeColor: Colors.green,
                  title: Text(language.name),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                  ),
                  child: const Text(
                    'Conferma',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RistoratoreHome(),
                      ),
                    );
                  },
                ),
              ],
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
