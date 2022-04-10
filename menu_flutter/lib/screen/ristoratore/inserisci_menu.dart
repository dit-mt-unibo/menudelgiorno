import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'scegli_lingua.dart';
import '../../models/app/user.dart';

class InserisciMenuScreen extends StatefulWidget {
  const InserisciMenuScreen({Key? key, required this.loggedUser})
      : super(key: key);
  final User loggedUser;
  @override
  State<InserisciMenuScreen> createState() => _InserisciMenuScreenState();
}

class _InserisciMenuScreenState extends State<InserisciMenuScreen> {
  TextEditingController menuText = TextEditingController();
  Future sendMenu() async {
    var url = "http://10.0.2.2:8000/api/menus";

    final msg = jsonEncode({
      "text": menuText.text,
      "restaurant_id": 2,
      "language_idArray": [3, 5, 7]
    });
    var response = await http.post(Uri.parse(url),
        headers: {"Content-type": "application/json"}, body: msg);
    var data = json.decode(response.body);
    print(data);
  }

  late String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Inserisci il testo del tuo menu',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 350,
              width: 900,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: Column(children: [
                TextField(
                  controller: menuText,
                  keyboardType: TextInputType.multiline,
                  onChanged: (text) {
                    value = text;
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Scrivi il menu',
                  ),
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(top: 90),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 40),
                ),
                child: const Text(
                  'Procedi',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScegliLinguaWidget(value: value, loggedUser: widget.loggedUser),
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
