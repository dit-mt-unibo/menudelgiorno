import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'scegli_lingua.dart';
import '../../models/app/user.dart';
import '../../models/app/menu.dart';

class InserisciMenuScreen extends StatefulWidget {
  const InserisciMenuScreen({Key? key, required this.loggedUser})
      : super(key: key);
  final User loggedUser;

  @override
  State<InserisciMenuScreen> createState() => _InserisciMenuScreenState();
}

class _InserisciMenuScreenState extends State<InserisciMenuScreen> {
  TextEditingController menuController = TextEditingController();

  Future<Menu> _getMenu(User user) async {
    final url = Uri.http('10.0.2.2:8000', '/api/menus/${user.id}');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final ciao = Menu.fromJson(data);
    return ciao;
  }

  Future sendMenu(Menu editmenu) async {
    final url =
        Uri.http('10.0.2.2:8000', '/api/restaurants/${editmenu.restaurantId}');
    final headers = {'Content-Type': 'application/json', 'Charset': 'utf-8'};

    final payload = jsonEncode({
      "text": editmenu.text,
      "restaurant_id": editmenu.restaurantId,
      "language_idArray": [3, 5, 7]
    });
    print(widget.loggedUser.id);
    final response = await http.post(url, headers: headers, body: payload);
    print(response.body);
    final data = jsonDecode(response.body);
    final menu = Menu.fromJson(data);
  }

  //il testo inserito diventa string
  late String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: FutureBuilder(
          future: _getMenu(widget.loggedUser),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final menu = snapshot.data as Menu;
              menuController.text = menu.text;
              return SingleChildScrollView(
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
                          controller: menuController,
                          keyboardType: TextInputType.multiline,
                          onChanged: (text) {
                            //il testo inserito diventa value
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
                              builder: (context) => ScegliLinguaWidget(
                                  menu: menu, loggedUser: widget.loggedUser),
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
