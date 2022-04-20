import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/restaurant/translation.dart';

class RestaurantTranslationCard extends StatelessWidget {
  const RestaurantTranslationCard({
    Key? key,
    required this.translation,
  }) : super(key: key);

  final RestaurantTranslation translation;

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        translation.languageCode,
                        style: const TextStyle(
                          fontSize: 26.0,
                          color: Color.fromARGB(255, 147, 19, 19),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 2.0),
                                child: Text(
                                  'Data creazione',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color.fromARGB(255, 147, 19, 19),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                translation.createdAt,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 147, 19, 19),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 2.0),
                                child: Text(
                                  'Ultima modifica',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color.fromARGB(255, 147, 19, 19),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                translation.updatedAt,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 147, 19, 19),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          translation.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 147, 19, 19),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 30.0,
              thickness: 1,
              color: Color.fromARGB(255, 147, 19, 19),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15.0),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: const Color.fromARGB(255, 147, 19, 19)),
                  child: const Text(
                    'Visualizza',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    final url =
                        "http://10.0.2.2:8000/translations/${translation.id}";
                    _launchInBrowser(url);
                  },
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
                  child: const Text(
                    'Codice QR',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    final url =
                        "http://10.0.2.2:8000/qrcodes/${translation.id}";
                    _launchInBrowser(url);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
