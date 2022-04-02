import 'package:flutter/material.dart';

import 'login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Menu del giorno'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home-background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 40),
              ),
              child: const Text(
                'ACCEDI',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
