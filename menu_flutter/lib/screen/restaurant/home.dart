import 'package:flutter/material.dart';

import '../../models/app/user.dart';
import '../../models/restaurant/translation.dart';
import '../../widgets/restaurant/navbar.dart';
import '../../widgets/restaurant/translation/card_list.dart';

class RestaurantHome extends StatelessWidget {
  const RestaurantHome({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  Future<List<RestaurantTranslation>> _getAllTranslations(User user) async {
    return [
      RestaurantTranslation(
        translationId: 1,
        translatedText: 'Menu in inglese',
      ),
      RestaurantTranslation(
        translationId: 2,
        translatedText: 'Menu in francese',
      ),
      RestaurantTranslation(
        translationId: 3,
        translatedText: 'Menu in tedesco',
      ),
      RestaurantTranslation(
        translationId: 4,
        translatedText: 'Menu in spagnolo',
      ),
      RestaurantTranslation(
        translationId: 5,
        translatedText: 'Menu in portoghese',
      ),
      RestaurantTranslation(
        translationId: 6,
        translatedText: 'Menu in cinese',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
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
            image: AssetImage('images/homeres.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder(
          future: _getAllTranslations(loggedUser),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final translations = snapshot.data as List<RestaurantTranslation>;
              return RestaurantTranslationCardList(
                translations: translations,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      drawer: RestaurantNavbar(
        loggedUser: loggedUser,
      ),
    );
  }
}
