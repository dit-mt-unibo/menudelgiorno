import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../models/app/registry.dart';
import '../../../models/app/user.dart';

class TranslatorRegistry extends StatelessWidget {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  TranslatorRegistry({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  Future _getRegistry() async {
    final userId = user.id;
    final url = Uri.http('10.0.2.2:8000', '/api/registries/$userId');
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilo'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
      ),
      body: FutureBuilder(
        future: _getRegistry(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Cognome',
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
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
                    final res = await _getRegistry();
                    final registry = Registry.fromJson(res);

                    print(registry);
                  },
                ),
              ],
            ),
          );

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
