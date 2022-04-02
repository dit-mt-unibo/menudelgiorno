import 'package:flutter/material.dart';

import 'ristorante_navbar.dart';

class RistoratoreHome extends StatefulWidget {
  const RistoratoreHome({Key? key}) : super(key: key);

  @override
  State<RistoratoreHome> createState() => _RistoratoreHomeState();
}

class _RistoratoreHomeState extends State<RistoratoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/immagine2.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: const Center(
          child: Text('Il mio Ristorante'),
        ),
      ),
      drawer: const RistoranteNavBar(),
    );
  }
}
