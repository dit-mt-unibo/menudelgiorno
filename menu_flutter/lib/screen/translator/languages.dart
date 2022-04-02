import 'package:flutter/material.dart';

import 'home.dart';

class TranslatorLanguages extends StatefulWidget {
  const TranslatorLanguages({Key? key}) : super(key: key);

  @override
  State<TranslatorLanguages> createState() => _TranslatorLanguagesState();
}

class _TranslatorLanguagesState extends State<TranslatorLanguages> {
  bool inglese = false;
  bool francese = false;
  bool tedesco = false;
  bool spagnolo = false;
  bool portoghese = false;
  bool russo = false;
  bool cinese = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le mie Lingue'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            CheckboxListTile(
              value: inglese,
              onChanged: (val) {
                setState(() {
                  inglese = val as bool;
                });
              },
              activeColor: Colors.green,
              title: const Text('Inglese'),
            ),
            CheckboxListTile(
              value: francese,
              onChanged: (val) {
                setState(() {
                  francese = val as bool;
                });
              },
              activeColor: Colors.green,
              title: const Text('Francese'),
            ),
            CheckboxListTile(
              value: tedesco,
              onChanged: (val) {
                setState(() {
                  tedesco = val as bool;
                });
              },
              activeColor: Colors.green,
              title: const Text('Tedesco'),
            ),
            CheckboxListTile(
              value: spagnolo,
              onChanged: (val) {
                setState(() {
                  spagnolo = val as bool;
                });
              },
              activeColor: Colors.green,
              title: const Text('Spagnolo'),
            ),
            CheckboxListTile(
              value: portoghese,
              onChanged: (val) {
                setState(() {
                  portoghese = val as bool;
                });
              },
              activeColor: Colors.green,
              title: const Text('Portoghese'),
            ),
            CheckboxListTile(
              value: russo,
              onChanged: (val) {
                setState(() {
                  russo = val as bool;
                });
              },
              activeColor: Colors.green,
              title: const Text('Russo'),
            ),
            CheckboxListTile(
              value: cinese,
              onChanged: (val) {
                setState(() {
                  cinese = val as bool;
                });
              },
              activeColor: Colors.green,
              title: const Text('Cinese'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ElevatedButton(
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
                      builder: (context) => const TranslatorHome(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
