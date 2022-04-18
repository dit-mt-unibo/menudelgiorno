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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/homeres.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 12, right: 12, top: 10),
                child: Column(
                  children: [
                    Card(
                      color: Color.fromARGB(108, 99, 99, 99),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Menu in inglese",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color:
                                        Color.fromARGB(255, 147, 19, 19),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    primary:
                                        const Color.fromARGB(255, 147, 19, 19)),
                                onPressed: () {},
                                child: const Text(
                                  'VISUALIZZA',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15.0),
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                primary: const Color.fromARGB(255, 147, 19, 19),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'QRCODE',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      elevation: 5,
                    ),
                    Card(
                      color: Color.fromARGB(113, 179, 169, 169),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Menu in francese",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color:
                                        Color.fromARGB(255, 147, 19, 19),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    primary:
                                        const Color.fromARGB(255, 147, 19, 19)),
                                onPressed: () {},
                                child: const Text(
                                  'VISUALIZZA',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15.0),
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                primary: const Color.fromARGB(255, 147, 19, 19),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'QRCODE',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      elevation: 0,
                    ),
                    Card(
                      color: Color.fromARGB(113, 179, 169, 169),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Menu in tedesco",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color:
                                        Color.fromARGB(255, 147, 19, 19),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    primary:
                                        const Color.fromARGB(255, 147, 19, 19)),
                                onPressed: () {},
                                child: const Text(
                                  'VISUALIZZA',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15.0),
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                primary: const Color.fromARGB(255, 147, 19, 19),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'QRCODE',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      elevation: 0,
                    ),
                    Card(
                      color: Color.fromARGB(113, 179, 169, 169),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 6.0),
                              child: Text(
                                "Menu in cinese",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color:
                                        Color.fromARGB(255, 147, 19, 19),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 9.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15.0),
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    primary:
                                        const Color.fromARGB(255, 147, 19, 19)),
                                onPressed: () {},
                                child: const Text(
                                  'VISUALIZZA',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15.0),
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                primary: const Color.fromARGB(255, 147, 19, 19),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'QRCODE',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: RistoranteNavBar(loggedUser: loggedUser),
    );
  }
}
