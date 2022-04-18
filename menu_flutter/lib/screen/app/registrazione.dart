import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'welcome.dart';

class RegistrazioneScreen extends StatefulWidget {
  const RegistrazioneScreen({Key? key}) : super(key: key);

  @override
  State<RegistrazioneScreen> createState() => _RegistrazioneScreenState();
}

class _RegistrazioneScreenState extends State<RegistrazioneScreen> {
  var value;

  //controlli dei campi
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController pwd_conf = TextEditingController();
  TextEditingController role = TextEditingController();

  //chiamata api di registratione utente
  Future register() async {
    var url = "http://10.0.2.2:8000/api/auth/register";
    var response = await http.post(Uri.parse(url), body: {
      "user": user.text,
      "email": email.text,
      "password": pwd.text,
      "password_confirmation": pwd_conf.text,
      "role": value
    });

    var data = json.decode(response.body);
    //messaggio di registrazione
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: 'Utente già registrato!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: 'Registrazione avvenuta con successo!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );

  }

  @override
  void initState() {
    super.initState();
    value = 1;
  }

  //per cambiare la radio
  setSelectedRadio(val) {
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
           image: DecorationImage(
            image: AssetImage("images/reg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20.0),
                child: Column(children: const [
                  Text(
                    'Nuovo utente',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Lancelot',
                        color: Color.fromARGB(255, 68, 1, 1),
                        fontWeight: FontWeight.normal),
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style:
                      const TextStyle(color: Color.fromARGB(255, 105, 104, 104)),
                  controller: user,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 147, 19, 19),
                            width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 107, 107, 107),
                            width: 1.5),
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: Color.fromARGB(255, 113, 2, 2),
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 69, 68, 68),
                          fontSize: 20.0)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style:
                      const TextStyle(color: Color.fromARGB(255, 105, 104, 104)),
                  controller: email,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 147, 19, 19),
                            width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 107, 107, 107),
                            width: 1.5),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 113, 2, 2),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 69, 68, 68),
                          fontSize: 20.0)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  obscureText: true,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 105, 105, 104)),
                  controller: pwd,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 147, 19, 19),
                            width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 107, 107, 107),
                            width: 1.5),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 69, 68, 68), fontSize: 20.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 113, 2, 2),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  obscureText: true,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 105, 105, 104)),
                  controller: pwd_conf,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 147, 19, 19),
                            width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 107, 107, 107),
                            width: 1.5),
                      ),
                      labelText: 'Conferma Password',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 69, 68, 68), fontSize: 20.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 113, 2, 2),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: "Ristoratore",
                    activeColor: Color.fromARGB(255, 113, 2, 2),
                    groupValue: value,
                    onChanged: (val) {
                      setState(() {
                        value = "Ristoratore";
                      });
                      setSelectedRadio(val as int);
                    },
                  ),
                  const Text('Ristoratore',style: TextStyle(fontSize: 25,fontFamily: 'Lancelot'),),
                  Radio(
                    value: "Traduttore",
                    activeColor: Color.fromARGB(255, 113, 2, 2),
                    groupValue: value,
                    onChanged: (val) {
                      setState(() {
                        value = "Traduttore";
                      });
                      setSelectedRadio(val as int);
                    },
                  ),
                  const Text('Traduttore',style: TextStyle(fontSize: 25,fontFamily: 'Lancelot')),
                ],
              ),
              Container(
                  width: 250,
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    primary: const Color.fromARGB(255, 147, 19, 19),
                  ),
                  child: const Text(
                    'Registra',
                    style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'
                    ),
                  ),
                  onPressed: () {
                    register();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
