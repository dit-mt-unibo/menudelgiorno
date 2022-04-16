import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/app/menu.dart';
import '../../../models/app/user.dart';
import 'scegli_lingua.dart';

class InserisciMenuScreen extends StatelessWidget {
  
  InserisciMenuScreen({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;
  final _menuController = TextEditingController();

  Future<Menu> _createMenu() async {
    final url = Uri.http('10.0.2.2:8000', '/api/menus');
    final headers = {'Content-Type': 'application/json'};

    final payload = jsonEncode({
      "text": _menuController.text,
      "restaurant_id": null,
      "language_idArray": null
    });
    final response = await http.post(url, headers: headers, body: payload);
    final data = jsonDecode(response.body);
    final menu = Menu.fromJson(data);
    return menu;
  }

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
                  fontSize: 50,
                  fontFamily: 'Tangerine',
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              Container(
                margin: const EdgeInsets.all(20),
                height: 350,
                width: 900,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 85, 2, 2),
                    width: 3,
                  ),
                ),
                child: Column(children: [
                  TextField(
                    controller: _menuController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
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
                    primary: const Color.fromARGB(255, 186, 12, 12),
                  ),
                  child: const Text(
                    'Procedi',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  onPressed: () {
                    _createMenu();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ScegliLinguaWidget(
                    //       menu: menu,
                    //       loggedUser: loggedUser,
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
