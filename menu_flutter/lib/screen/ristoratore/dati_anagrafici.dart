import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../models/app/registry.dart';
import '../../models/app/user.dart';

class DatiAnagraficiWidget extends StatelessWidget {
  DatiAnagraficiWidget({Key? key, required this.loggedUser}) : super(key: key);

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  final User loggedUser;

  TextEditingController nome = TextEditingController();
  TextEditingController cognome = TextEditingController();
  TextEditingController email = TextEditingController();

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
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
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
                  TextField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Cognome',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
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
