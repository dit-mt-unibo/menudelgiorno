import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'il_mio_ristorante.dart';

class DatiAnagraficiWidget extends StatefulWidget {
  const DatiAnagraficiWidget({Key? key}) : super(key: key);

  @override
  State<DatiAnagraficiWidget> createState() => _DatiAnagraficiWidgetState();
}

class User {
  final String nome, cognome, email;
  User(this.nome, this.cognome, this.email);
}

class _DatiAnagraficiWidgetState extends State<DatiAnagraficiWidget> {
  TextEditingController nome = TextEditingController();
  TextEditingController cognome = TextEditingController();
  TextEditingController email = TextEditingController();

  Future getData() async {
    var url = 'http://10.0.2.2:8000/api/registries/17'; //cambiare il numero in base all'id
    var response = await http.put(Uri.parse(url), body: {
      "first_name": nome.text,
      "last_name": cognome.text,
      "email": email.text
    });
    json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dati anagrafici'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I miei dati anagrafici',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: nome,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: cognome,
                decoration: const InputDecoration(
                  labelText: 'Cognome',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 40),
                ),
                child: const Text(
                  'Salva',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                onPressed: () {
                  getData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IlMioRistoranteScreen(),
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
