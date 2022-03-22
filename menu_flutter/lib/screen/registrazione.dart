import 'package:flutter/material.dart';

import '../widgets/dati_anagrafici.dart';

class RegistrazioneScreen extends StatefulWidget {
  const RegistrazioneScreen({Key? key}) : super(key: key);

  @override
  State<RegistrazioneScreen> createState() => _RegistrazioneScreenState();
}

class _RegistrazioneScreenState extends State<RegistrazioneScreen> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = 0;
  }

  //per cambiare la radio
  setSelectedRadio(int val) {
    setState(() {
      value = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrazione'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Conferma Password',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: value,
                  onChanged: (val) {
                    // print('Sono ristoratore');
                    setSelectedRadio(val as int);
                  },
                ),
                const Text('Ristoratore'),
                Radio(
                  value: 1,
                  groupValue: value,
                  onChanged: (val) {
                    // print('Sono traduttore');
                    setSelectedRadio(val as int);
                  },
                ),
                const Text('Traduttore'),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 40),
                ),
                child: const Text(
                  'Continua',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DatiAnagraficiWidget(),
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
