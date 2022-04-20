import 'package:flutter/material.dart';

import '../../models/app/user.dart';
import '../../screen/app/welcome.dart';
import '../../screen/restaurant/dati_anagrafici.dart';
import '../../screen/restaurant/home.dart';
import '../../screen/restaurant/il_mio_ristorante.dart';
import '../../screen/restaurant/inserisci_menu.dart';

class RestaurantNavbar extends StatelessWidget {
  const RestaurantNavbar({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

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
          fontSize: 15,
          fontFamily: 'NotoSerifDisplay',
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold
                      
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
            builder: (context) => RestaurantHome(
              loggedUser: loggedUser,
            ),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DatiAnagraficiWidget(
              loggedUser: loggedUser,
            ),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IlMioRistoranteScreen(
              loggedUser: loggedUser,
            ),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InserisciMenuScreen(
              loggedUser: loggedUser,
            ),
          ),
        );
        break;
      case 4:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
          (route) => false,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 147, 19, 19),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 45,
          ),
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
