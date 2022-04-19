import 'package:flutter/material.dart';

import '../../../models/app/user.dart';
import 'scegli_lingua.dart';

class InserisciMenuScreen extends StatelessWidget {
  InserisciMenuScreen({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  final _menuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'NotoSerifDisplay',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Inserisci il testo del tuo menu',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Lancelot',
                  color: Color.fromARGB(255, 147, 19, 19),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                height: 400,
                width: 900,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 85, 2, 2),
                    width: 3,
                  ),
                ),
                child: Column(children: [
                  TextField(
                    controller: _menuController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Scrivi il menu',
                    ),
                  ),
                ]),
              ),
              Container(
                width: 250,
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15.0),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    primary: const Color.fromARGB(255, 147, 19, 19),
                  ),
                  child: const Text(
                    'Procedi',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 2.0,
                      fontFamily: 'NotoSerifDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScegliLinguaWidget(
                          menuText: _menuController.text,
                          loggedUser: loggedUser,
                        ),
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
