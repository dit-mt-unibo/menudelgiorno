import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../blocs/login_bloc.dart';
import '../translator/home.dart';
import 'registrazione.dart';
import '../ristoratore/ristoratore_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  LoginBloc bloc = LoginBloc();

  prosesLogin() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    print('Running on ${androidInfo.model}');
    String user = userController.text;
    String password = passwordController.text;
    Map params = jsonDecode(
        '{"user": "$user","password": "$password", "device": " ${androidInfo.model}"}');
    print(params);
    bloc.doLogin(params);

    bloc.stream.listen((data) {
      print(data);
      switch (data["user"]["role"]) {
        case "Ristoratore":
          {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RistoratoreHome()),
            );
          }
          break;
        case "Traduttore":
          {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TranslatorHome()),
            );
          }
          break;

        default:
          {
            print("Qualcosa è andato storto");
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
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
              padding: const EdgeInsets.all(90),
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
                  prosesLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
