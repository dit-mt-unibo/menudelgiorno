import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'registrazione.dart';
import 'traduttore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TraduttoreScreen(),
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
