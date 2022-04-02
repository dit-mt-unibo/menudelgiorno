import 'package:flutter/material.dart';

import '../scegli_lingua.dart';

class InserisciMenuScreen extends StatefulWidget {
  const InserisciMenuScreen({Key? key}) : super(key: key);

  @override
  State<InserisciMenuScreen> createState() => _InserisciMenuScreenState();
}

class _InserisciMenuScreenState extends State<InserisciMenuScreen> {
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
              child: Column(children: const [
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Scrivi il menu',
                  ),
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(top: 150),
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
                      builder: (context) => const ScegliLinguaWidget(),
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
