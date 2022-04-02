import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ristoratore/il_mio_ristorante.dart';

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
  List dataList = [];
  Future getData() async {
    var url = 'http://10.0.2.2:8000:/api/registries';
    var response = await http.get(Uri.http(url, 'id'));
    var jsonData = jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Cognome',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
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
