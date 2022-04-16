import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/app/registry.dart';
import '../../../models/app/user.dart';

class TranslatorEditRegistry extends StatelessWidget {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  TranslatorEditRegistry({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  Future<Registry> _getRegistry(User user) async {
    final url = Uri.http('10.0.2.2:8000', '/api/registries/${user.id}');
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final registry = Registry.fromJson(data);
    return registry;
  }

  Future<bool> _updateRegistry(Registry registry) async {
    final url = Uri.http('10.0.2.2:8000', '/api/registries/${registry.id}');
    final headers = {'Content-Type': 'application/json'};
    final payload = jsonEncode({
      'first_name': registry.firstName,
      'last_name': registry.lastName,
      'email': registry.email,
    });
    final response = await http.put(url, headers: headers, body: payload);
    return response.statusCode == 200 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilo'),
        backgroundColor: Color.fromARGB(255, 6, 54, 188),
      ),
      body: FutureBuilder(
        future: _getRegistry(loggedUser),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final registry = snapshot.data as Registry;
            _firstNameController.text = registry.firstName;
            _lastNameController.text = registry.lastName;
            _emailController.text = registry.email;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20.0),
              child: Column(children: const [
                Text(
                  'Modifica profilo',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Lancelot',
                      color: const Color.fromARGB(255, 6, 54, 188),
                      fontWeight: FontWeight.normal),
                ),
              ]),
            ),
             SizedBox(
              height: 50,
            ),
                  TextField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,

                     style:
                    const TextStyle(color: Color.fromARGB(255, 105, 104, 104)),
                
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 6, 54, 188),
                          width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 107, 107, 107),
                          width: 1.5),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 6, 54, 188),
                    ),
                    labelText: 'Nome',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 69, 68, 68),
                        fontSize: 25.0)),
              
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,

                     style:
                    const TextStyle(color: Color.fromARGB(255, 105, 104, 104)),
              
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 6, 54, 188),
                          width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 107, 107, 107),
                          width: 1.5),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 6, 54, 188),
                    ),
                    labelText: 'Cognome',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 69, 68, 68),
                        fontSize: 25.0)),
              
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,

                     style:
                    const TextStyle(color: Color.fromARGB(255, 105, 104, 104)),
  
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 6, 54, 188),
                          width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 107, 107, 107),
                          width: 1.5),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 6, 54, 188),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 69, 68, 68),
                        fontSize: 25.0)),
              
                  ),
                  const SizedBox(
                    height: 50,
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
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        final enteredRegistry = Registry(
                          id: registry.id,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                        );
                        final isUpdateSuccessful =
                            await _updateRegistry(enteredRegistry);
                        if (isUpdateSuccessful) {
                          Fluttertoast.showToast(
                            msg: 'Nuovi dati salvati con successo!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM_RIGHT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Errore durante il salvataggio!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM_RIGHT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        }
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
        },
      ),
    );
  }
}
