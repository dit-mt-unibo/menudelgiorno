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

  Future<Menu> _getMenu(User user) async {
    final url = Uri.http('10.0.2.2:8000', '/api/menus/${user.id}');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final menu = Menu.fromJson(data);
    return menu;
  }

  final _menuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: FutureBuilder(
          future: _getMenu(loggedUser),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final menu = snapshot.data as Menu;
              _menuController.text = menu.text;
              return SingleChildScrollView(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Inserisci il testo del tuo menu',
                      style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Lancelot',
                      color: const Color.fromARGB(255, 147, 19, 19),
                      fontWeight: FontWeight.normal),
                      ),
                    SizedBox(height: 10.0,),
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 400,
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
                        width: 250,
                      padding: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  primary: const Color.fromARGB(255, 147, 19, 19),
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
                              builder: (context) => ScegliLinguaWidget(
                                menu: menu,
                                loggedUser: loggedUser,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}