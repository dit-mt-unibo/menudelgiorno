import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../widgets/dati_anagrafici.dart';

class RegistrazioneScreen extends StatefulWidget {
  const RegistrazioneScreen({Key? key}) : super(key: key);

  @override
  State<RegistrazioneScreen> createState() => _RegistrazioneScreenState();
}

class _RegistrazioneScreenState extends State<RegistrazioneScreen> {
  late int value;

  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController pwd_conf = TextEditingController();
  TextEditingController role = TextEditingController();

  Future register() async {
    var url = "http://10.0.2.2:8000/api/auth/register";
    var response = await http.post(Uri.parse(url),
    headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
     body: {
      "user": user.text,
      "email": email.text,
      "password": pwd.text,
      "password_confirmation" : pwd_conf.text,
      "role": "Ristoratore"
    });

    var data = json.decode(response.body);
    print(data);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Questo utente esiste già",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Registrazione effetuta!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

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
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: pwd,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: pwd_conf,
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
                  register();
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
