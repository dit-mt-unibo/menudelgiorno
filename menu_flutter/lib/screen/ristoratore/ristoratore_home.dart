import 'package:flutter/material.dart';

import 'ristorante_navbar.dart';
import '../../models/app/user.dart';

class RistoratoreHome extends StatelessWidget {
 const RistoratoreHome({Key? key, required this.loggedUser}) : super(key: key);

  final User loggedUser;

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
      drawer:  RistoranteNavBar(loggedUser: loggedUser),
    );
  }
}
