import 'package:flutter/material.dart';

import 'traduttore_navbar.dart';

class TraduttoreScreen extends StatefulWidget {
  const TraduttoreScreen({Key? key}) : super(key: key);

  @override
  State<TraduttoreScreen> createState() => _TraduttoreScreenState();
}

class _TraduttoreScreenState extends State<TraduttoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
        elevation: 1,
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/download.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: const Center(
            child: Text('Menu disponibili'),
          )),
      drawer: const TraduttoreNavBar(),
    );
  }
}
