import 'package:flutter/material.dart';

import 'navbar.dart';

class TranslatorHome extends StatefulWidget {
  const TranslatorHome({Key? key}) : super(key: key);

  @override
  State<TranslatorHome> createState() => _TranslatorHomeState();
}

class _TranslatorHomeState extends State<TranslatorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
        elevation: 1,
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/download.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: const Center(
            child: Text('Menu disponibili'),
          )),
      drawer: const TranslatorNavbar(),
    );
  }
}
