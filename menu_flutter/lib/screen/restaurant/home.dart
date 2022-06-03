import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/app/user.dart';
import '../../models/restaurant/translation.dart';
import '../../widgets/restaurant/navbar.dart';
import '../../widgets/restaurant/translation/card_list.dart';
import '../../environment.dart';

class RestaurantHome extends StatelessWidget {
  const RestaurantHome({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  Future<List<RestaurantTranslation>> _getAllTranslations(User user) async {
    final url = Uri.http(Environment().config.apiHost, '/api/users/${user.id}/translations');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      return [];
    }

    final jsonResponse = jsonDecode(response.body);

    List<RestaurantTranslation> translations = jsonResponse
        .map<RestaurantTranslation>(
            (rawTranslation) => RestaurantTranslation.fromJson(rawTranslation))
        .toList();

    return translations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Traduzioni Menu',
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
