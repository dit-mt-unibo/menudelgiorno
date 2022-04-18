import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../models/app/restaurant.dart';
import '../../../models/app/user.dart';

class IlMioRistoranteScreen extends StatelessWidget {
  IlMioRistoranteScreen({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  final User loggedUser;

  Future<Restaurant> _getRestaurant(User user) async {
    final url = Uri.http('10.0.2.2:8000', '/api/restaurants/${user.id}');
    final response = await http.get(url);
    print(response.reasonPhrase);
    final data = jsonDecode(response.body);
    final restaurant = Restaurant.fromJson(data);
    return restaurant;
  }

  Future<bool> _updateRestaurant(Restaurant restaurant) async {
    final url = Uri.http('10.0.2.2:8000', '/api/restaurants/${restaurant.id}');

    final headers = {'Content-Type': 'application/json'};

    final payload = jsonEncode({
      'name': restaurant.name,
      'address': restaurant.address,
      'street_number': restaurant.streetNumber,
      'postcode': restaurant.postcode,
      'city': restaurant.city,
      'province': restaurant.province,
    });

    final response = await http.put(url, headers: headers, body: payload);

    return response.statusCode == 200 ? true : false;
  }

  final _restaurantNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _streetNumberController = TextEditingController();
  final _postCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ristorante'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder(
          future: _getRestaurant(loggedUser),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final restaurant = snapshot.data as Restaurant;
              _restaurantNameController.text = restaurant.name;
              _addressController.text = restaurant.address;
              _streetNumberController.text = restaurant.streetNumber;
              _postCodeController.text = restaurant.postcode;
              _cityController.text = restaurant.city;
              _provinceController.text = restaurant.province;

              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: const Text(
                        'Il mio Ristorante',
                        style: TextStyle(
                          
                            fontSize: 30.0,
                            fontFamily: 'Lancelot',
                            color: const Color.fromARGB(255, 147, 19, 19),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _restaurantNameController,
                        style: const TextStyle(
                            color: Colors.black),
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 147, 19, 19),
                                  width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.5),
                            ),
                            prefixIcon: Icon(
                              Icons.restaurant,
                              color: const Color.fromARGB(255, 147, 19, 19),
                            ),
                            labelText: 'Nome Ristorante',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _addressController,
                        style: const TextStyle(
                            color: Colors.black),
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 147, 19, 19),
                                  width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.5),
                            ),
                            prefixIcon: Icon(
                              Icons.streetview_rounded,
                              color: const Color.fromARGB(255, 147, 19, 19),
                            ),
                            labelText: 'Indirizzo',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0)),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          child: TextFormField(
                            controller: _streetNumberController,
                            style: const TextStyle(
                                color: Colors.black),
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 147, 19, 19),
                                      width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.5),
                                ),
                                prefixIcon: Icon(
                                  Icons.streetview,
                                  color: const Color.fromARGB(255, 147, 19, 19),
                                ),
                                labelText: 'N° civico',
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 20.0, right: 20.0),
                          child: TextFormField(
                            controller: _postCodeController,
                            style: const TextStyle(
                                color: Colors.black),
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 147, 19, 19),
                                      width: 1.5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.5),
                                ),
                                prefixIcon: Icon(
                                  Icons.local_post_office_rounded,
                                  color: const Color.fromARGB(255, 147, 19, 19),
                                ),
                                labelText: 'Cap',
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0)),
                          ),
                        ),
                      ),
                    ]),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _cityController,
                        style: const TextStyle(
                            color: Colors.black),
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 147, 19, 19),
                                  width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.5),
                            ),
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: const Color.fromARGB(255, 147, 19, 19),
                            ),
                            labelText: 'Città',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: _provinceController,
                        style: const TextStyle(
                            color: Colors.black),
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(255, 147, 19, 19),
                                  width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.5),
                            ),
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: const Color.fromARGB(255, 147, 19, 19),
                            ),
                            labelText: 'Provincia',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          primary: const Color.fromARGB(255, 147, 19, 19),
                        ),
                        child: const Text(
                          'Salva',
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        onPressed: () async {
                          final enteredRestaurant = Restaurant(
                            id: restaurant.id,
                            name: _restaurantNameController.text,
                            address: _addressController.text,
                            streetNumber: _streetNumberController.text,
                            postcode: _postCodeController.text,
                            city: _cityController.text,
                            province: _provinceController.text,
                          );
                          final isUpdateSuccessful =
                              await _updateRestaurant(enteredRestaurant);
                          if (isUpdateSuccessful) {
                            Fluttertoast.showToast(
                              msg: 'Ristorante salvato con successo!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM_RIGHT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: 'Errore durante il salvataggio!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM_RIGHT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
