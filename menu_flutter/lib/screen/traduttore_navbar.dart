import 'package:flutter/material.dart';

import '../widgets/dati_anagrafici.dart';
import 'login.dart';
import 'traduttore.dart';
import 'welcome.dart';

class TraduttoreNavBar extends StatelessWidget {
  const TraduttoreNavBar({Key? key}) : super(key: key);

  final padding = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 70,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 26, 85, 247),
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 45),
            buildMenu(
              icon: Icons.dashboard,
              titolo: 'Home',
              onclick: () => selectedItem(context, 0),
            ),
            buildMenu(
              icon: Icons.person,
              titolo: 'I miei dati',
              onclick: () => selectedItem(context, 1),
            ),
            buildMenu(
              icon: Icons.logout,
              titolo: 'Esci',
              onclick: () => selectedItem(context, 4),
            ),
            const Divider(),
            buildMenu(
              icon: Icons.close_rounded,
              titolo: 'Chiudi',
              onclick: () => selectedItem(context, 0),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildMenu({
  required IconData icon,
  required String titolo,
  VoidCallback? onclick,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      titolo,
      style: const TextStyle(
        color: Color.fromARGB(255, 247, 246, 244),
        fontFamily: 'Sanchez',
        fontSize: 15,
      ),
    ),
    onTap: onclick,
  );
}

selectedItem(BuildContext context, int i) {
  switch (i) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TraduttoreScreen(),
        ),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const DatiAnagraficiWidget(),
        ),
      );
      break;
    case 2:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      break;
    case 3:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      break;
    case 4:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      );
      break;
    case 5:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      break;
    default:
  }
}
