import 'package:flutter/material.dart';

import 'inserisci_menu.dart';
import '../../models/app/user.dart';

class IlMioRistoranteScreen extends StatefulWidget {
  const IlMioRistoranteScreen({Key? key, required this.loggedUser})
      : super(key: key);
  final User loggedUser;

  @override
  State<IlMioRistoranteScreen> createState() => _IlMioRistoranteScreenState();
}

class _IlMioRistoranteScreenState extends State<IlMioRistoranteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ristorante'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Il mio Ristorante',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
              ),
            ),
          ),
          Row(children: [
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Indirizzo',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'N° civico',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Cap',
                  ),
                ),
              ),
            ),
          ]),
          Row(children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Città',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Provincia',
                  ),
                ),
              ),
            ),
          ]),
          Row(children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Telefono',
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Cellulare',
                  ),
                ),
              ),
            ),
          ]),
          Container(
            padding: const EdgeInsets.only(top: 20),
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
                    builder: (context) => InserisciMenuScreen(loggedUser: widget.loggedUser),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
