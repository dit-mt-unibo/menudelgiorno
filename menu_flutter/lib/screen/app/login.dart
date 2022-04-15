import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/app/user.dart';
import '../ristoratore/ristoratore_home.dart';
import '../translator/pages/home.dart';
import 'registrazione.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _pwdController = TextEditingController();

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

    switch (loggedUser.role) {
      case "Ristoratore":
        {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RistoratoreHome(loggedUser: loggedUser),
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
              builder: (context) => TranslatorHome(loggedUser: loggedUser),
            ),
          );
        }
        break;
      default:
        {
          print("Qualcosa è andato storto");
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
         padding: const EdgeInsets.only(top: 150),
        
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _pwdController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: 'Non hai un account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  TextSpan(
                      text: 'Registrati',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 67, 44, 245),
                        fontSize: 22,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrazioneScreen(),
                            ),
                          );
                        }),
                ]),
              ),
              Container(
                padding: const EdgeInsets.all(90.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  onPressed: () {
                    _doLogin();
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
