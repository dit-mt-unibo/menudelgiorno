import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../models/app/restaurant.dart';
import 'inserisci_menu.dart';
import '../../models/app/user.dart';

class IlMioRistoranteScreen extends StatelessWidget {
  IlMioRistoranteScreen({Key? key, required this.loggedUser}) : super(key: key);

  final _restaurantNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _streetNumberController = TextEditingController();
  final _postCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();

  final User loggedUser;
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController street_number = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController province = TextEditingController();

  Future<Restaurant> _getRestaurant(User user) async {
    final url = Uri.http('10.0.2.2:8000', '/api/restaurants/${user.id}');
    final response = await http.get(url);
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
      'streetNumber': restaurant.street_number,
      'postcode': restaurant.postcode,
      'city': restaurant.city,
      'province': restaurant.province,
    });

    final response = await http.put(url, headers: headers, body: payload);

    return response.statusCode == 200 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ristorante'),
        backgroundColor: const Color.fromARGB(255, 147, 19, 19),
      ),
      body: FutureBuilder(
        future: _getRestaurant(loggedUser),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final restaurant = snapshot.data as Restaurant;
            _restaurantNameController.text = restaurant.name;
            _addressController.text = restaurant.address;
            _streetNumberController.text = restaurant.street_number;
            _postCodeController.text = restaurant.postcode;
            _cityController.text = restaurant.city;
            _provinceController.text = restaurant.province;

            return SingleChildScrollView(
              // padding: const EdgeInsets.all(32.0),
              child: Container(
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Il mio Ristorante',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(
                          controller: _restaurantNameController,
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                          ),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _addressController,
                            decoration: const InputDecoration(
                              labelText: 'Indirizzo',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          child: TextFormField(
                            controller: _streetNumberController,
                      
                            decoration: const InputDecoration(
                              labelText: 'N° civico',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          child: TextFormField(
                            controller: _postCodeController,
                            decoration: const InputDecoration(
                              labelText: 'Cap',
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _cityController,
                            decoration: const InputDecoration(
                              labelText: 'Città',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _provinceController,
                            decoration: const InputDecoration(
                              labelText: 'Provincia',
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 40),
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
                            street_number: _streetNumberController.text,
                            postcode: _postCodeController.text,
                            city: _cityController.text,
                            province: _provinceController.text,
                          );
                          final isUpdateSuccessful =
                              await _updateRestaurant(enteredRestaurant);
                          if (isUpdateSuccessful) {
                            Fluttertoast.showToast(
                              msg: 'Nuovi dati salvati con successo!',
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
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
