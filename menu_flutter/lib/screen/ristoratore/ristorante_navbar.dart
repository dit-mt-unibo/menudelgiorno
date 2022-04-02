import 'package:flutter/material.dart';

import 'dati_anagrafici.dart';
import 'il_mio_ristorante.dart';
import 'inserisci_menu.dart';
import '../app/login.dart';
import 'ristoratore_home.dart';

class RistoranteNavBar extends StatelessWidget {
  const RistoranteNavBar({Key? key}) : super(key: key);

  final padding = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 45,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 147, 19, 19),
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
              icon: Icons.restaurant,
              titolo: 'Il mio Ristorante',
              onclick: () => selectedItem(context, 2),
            ),
            buildMenu(
              icon: Icons.restaurant_menu_rounded,
              titolo: 'Il mio Menu',
              onclick: () => selectedItem(context, 3),
            ),
            buildMenu(
              icon: Icons.logout,
              titolo: 'Logout',
              onclick: () => selectedItem(context, 4),
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
          builder: (context) => const RistoratoreHome(),
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
          builder: (context) => const IlMioRistoranteScreen(),
        ),
      );
      break;
    case 3:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const InserisciMenuScreen(),
        ),
      );
      break;
    case 4:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
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
