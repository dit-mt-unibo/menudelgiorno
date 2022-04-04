import 'package:flutter/material.dart';

import '../../models/language.dart';
import '../../models/translator/translation_home_dto.dart';
import '../../models/translator/translations_home_dto.dart';
import 'navbar.dart';

class TranslatorHome extends StatefulWidget {
  const TranslatorHome({Key? key}) : super(key: key);

  @override
  State<TranslatorHome> createState() => _TranslatorHomeState();
}

class _TranslatorHomeState extends State<TranslatorHome> {
  Future<void> _getAllTranslations() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => TranslationsHomeDto(
        translations: [
          TranslationHomeDto(
            id: 1,
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            language: Language(id: 2, name: 'Inglese'),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          TranslationHomeDto(
            id: 2,
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            language: Language(id: 2, name: 'Inglese'),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          TranslationHomeDto(
            id: 5,
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Curabitur id mi non enim suscipit ornare ut id lorem.Sed ornare odio nec consequat mollis.Vivamus nec urna eu augue interdum volutpat nec non lectus.Vestibulum eu ipsum nec mi condimentum convallis.',
            language: Language(id: 7, name: 'Cinese'),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getAllTranslations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 26, 85, 247),
        elevation: 1,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/download.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(100, 26, 85, 247),
            ),
          ),
          FutureBuilder(
            future: _getAllTranslations(),
            builder: (context, snapshot) {
              // Quando ha completato la Future
              if (snapshot.hasData) {
                final translationsObject = snapshot.data as TranslationsHomeDto;
                final translations = translationsObject.translations;
                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: translations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        translations[index].text,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text('Inglese'),
                                    Text('Francese'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }

              // Mentre attende il completamento della Future
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
      drawer: const TranslatorNavbar(),
    );
  }
}
