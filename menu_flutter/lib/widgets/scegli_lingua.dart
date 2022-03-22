import 'package:flutter/material.dart';

import '../screen/ristoratore_home.dart';

class ScegliLinguaWidget extends StatefulWidget {
  const ScegliLinguaWidget({Key? key}) : super(key: key);

  @override
  State<ScegliLinguaWidget> createState() => _ScegliLinguaWidgetState();
}

class _ScegliLinguaWidgetState extends State<ScegliLinguaWidget> {
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
      body: Column(
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
      ),
    );
  }
}
