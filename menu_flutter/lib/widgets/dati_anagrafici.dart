import 'package:flutter/material.dart';

import '../screen/il_mio_ristorante.dart';

class DatiAnagraficiWidget extends StatefulWidget {
  const DatiAnagraficiWidget({Key? key}) : super(key: key);

  @override
  State<DatiAnagraficiWidget> createState() => _DatiAnagraficiWidgetState();
}

class _DatiAnagraficiWidgetState extends State<DatiAnagraficiWidget> {
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
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Codice Fiscale',
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
