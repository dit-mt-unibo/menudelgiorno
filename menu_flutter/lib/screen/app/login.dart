import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/app/user.dart';
import '../restaurant/home.dart';
import '../translator/home.dart';
import 'registrazione.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  Future _doLogin() async {
    final url = Uri.http('10.0.2.2:8000', '/api/auth/login');

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    final headers = {'Content-Type': 'application/json'};

    final payload = jsonEncode({
      'user': _userController.text,
      'password': _pwdController.text,
      'device': " ${androidInfo.model}",
    });

    final response = await http.post(url, headers: headers, body: payload);

    final data = json.decode(response.body);

    final loggedUser = User.fromJson(data['user']);

    return loggedUser;
  }

  final _userController = TextEditingController();
  final _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Benvenuto',
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
            image: AssetImage('images/homes.jpg'),
            fit: BoxFit.fill,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255)
            ],
            stops: [
              0.1,
              0.4,
              0.7,
              0.9,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: const [
                      Text(
                        'Accedi per continuare',
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
                  height: 25.0,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: _userController,
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
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
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
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Non hai un account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Registrati',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 147, 19, 19),
                            fontSize: 18,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrazioneScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  width: 250,
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
                      'Login',
                      style: TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 2.0,
                        fontFamily: 'NotoSerifDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      User loggedUser = await _doLogin();
                      switch (loggedUser.role) {
                        case "Ristoratore":
                          {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantHome(
                                  loggedUser: loggedUser,
                                ),
                              ),
                            );
                          }
                          break;
                        case "Traduttore":
                          {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TranslatorHome(
                                  loggedUser: loggedUser,
                                ),
                              ),
                            );
                          }
                          break;
                        default:
                          {
                            print("Qualcosa è andato storto");
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
