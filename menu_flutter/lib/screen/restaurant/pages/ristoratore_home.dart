import 'package:flutter/material.dart';

import '../../../models/app/user.dart';
import '../widgets/ristorante_navbar.dart';

class RistoratoreHome extends StatelessWidget {
  const RistoratoreHome({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

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
            image: AssetImage("images/homeres.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Menu in inglese",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 255, 33, 17),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 186, 12, 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              ),
                        ),
                        child: Text("VISUALIZZA"),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 186, 12, 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              ),
                        ),
                        child: Text("QRCODE"),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
      drawer: RistoranteNavBar(loggedUser: loggedUser),
    );
  }
}
