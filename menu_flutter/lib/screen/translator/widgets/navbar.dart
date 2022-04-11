import 'package:flutter/material.dart';

import '../../../models/app/user.dart';
import '../../app/welcome.dart';
import '../pages/home.dart';
import '../pages/languages_edit.dart';
import '../pages/registry_edit.dart';

class TranslatorNavbar extends StatelessWidget {
  const TranslatorNavbar({
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
            builder: (context) => TranslatorHome(loggedUser: loggedUser),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                TranslatorRegistryEdit(loggedUser: loggedUser),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                TranslatorLanguagesEdit(loggedUser: loggedUser),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 26, 85, 247),
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 70,
          ),
          children: [
            const SizedBox(height: 45),
            buildMenu(
              icon: Icons.home,
              titolo: 'Home',
              onclick: () => selectedItem(context, 0),
            ),
            buildMenu(
              icon: Icons.person,
              titolo: 'Il mio Profilo',
              onclick: () => selectedItem(context, 1),
            ),
            buildMenu(
              icon: Icons.language,
              titolo: 'Le mie Lingue',
              onclick: () => selectedItem(context, 2),
            ),
            const Divider(),
            buildMenu(
              icon: Icons.logout,
              titolo: 'Logout',
              onclick: () => selectedItem(context, 3),
            ),
          ],
        ),
      ),
    );
  }
}
