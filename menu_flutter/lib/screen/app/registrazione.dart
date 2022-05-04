import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'welcome.dart';

class RegistrazioneScreen extends StatefulWidget {
  const RegistrazioneScreen({Key? key}) : super(key: key);

  @override
  State<RegistrazioneScreen> createState() => _RegistrazioneScreenState();
}

enum Role {
  ristoratore,
  traduttore,
}

extension ParseToString on Role {
  String toCapitalizedString() {
    return name[0].toUpperCase() + name.substring(1);
  }
}

class _RegistrazioneScreenState extends State<RegistrazioneScreen> {
  Role? _role = Role.ristoratore;

  Future<bool> _register({
    required String user,
    required String email,
    required String password,
    required String passwordConfirmation,
    required Role role,
  }) async {
    final url = Uri.http('10.0.2.2:8000', '/api/auth/register');

    final headers = {'Content-Type': 'application/json'};

    final payload = json.encode({
      "user": user,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "role": role.toCapitalizedString(),
    });

    final response = await http.post(url, headers: headers, body: payload);

    return response.statusCode == 201 ? true : false;
  }

  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _pwdConfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrazione',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'NotoSerifDisplay',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/reg.jpg'),
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
                child: Column(
                  children: const [
                    Text(
                      'Nuovo utente',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Lancelot',
                        color: Color.fromARGB(255, 68, 1, 1),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: _userController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 147, 19, 19),
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 107, 107, 107),
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.people,
                      color: Color.fromARGB(255, 113, 2, 2),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 147, 19, 19),
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 107, 107, 107),
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 113, 2, 2),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: _pwdController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 147, 19, 19),
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 107, 107, 107),
                        width: 1.5,
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 113, 2, 2),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: _pwdConfController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 147, 19, 19),
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 107, 107, 107),
                        width: 1.5,
                      ),
                    ),
                    labelText: 'Conferma Password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 113, 2, 2),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Ristoratore',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Lancelot',
                        ),
                      ),
                      leading: Radio<Role>(
                        value: Role.ristoratore,
                        activeColor: const Color.fromARGB(255, 113, 2, 2),
                        groupValue: _role,
                        onChanged: (Role? value) {
                          setState(() {
                            _role = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        'Traduttore',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Lancelot',
                        ),
                      ),
                      leading: Radio<Role>(
                        value: Role.traduttore,
                        activeColor: const Color.fromARGB(255, 113, 2, 2),
                        groupValue: _role,
                        onChanged: (Role? newValue) {
                          setState(() {
                            _role = newValue;
                          });
                        },
                      ),
                    ),
                  ),
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
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    primary: const Color.fromARGB(255, 147, 19, 19),
                  ),
                  child: const Text(
                    'Registra',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 2.0,
                      fontFamily: 'NotoSerifDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    final isRegisterSuccessful = await _register(
                      user: _userController.text,
                      email: _emailController.text,
                      password: _pwdController.text,
                      passwordConfirmation: _pwdConfController.text,
                      role: _role!,
                    );
                    if (isRegisterSuccessful) {
                      Fluttertoast.showToast(
                        msg: 'Registrazione avvenuta con successo!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Utente già registrato!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    );
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
