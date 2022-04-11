import 'package:flutter/material.dart';

import '../../../../models/app/language.dart';
import '../../../../models/translator/language/matched_language_dto.dart';
import 'language_checkbox.dart';

class TranslatorLanguageCheckboxList extends StatefulWidget {
  const TranslatorLanguageCheckboxList({
    Key? key,
    required this.matchedLanguages,
  }) : super(key: key);

  final List<MatchedLanguageDto> matchedLanguages;

  @override
  State<TranslatorLanguageCheckboxList> createState() =>
      _TranslatorLanguageCheckboxListState();
}

class _TranslatorLanguageCheckboxListState
    extends State<TranslatorLanguageCheckboxList> {
  void setCheckboxState(Language checkedLanguage, bool checked) {
    setState(() {
      widget.matchedLanguages
          .singleWhere(
              (matchedLanguage) => matchedLanguage.language == checkedLanguage)
          .isChecked = checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          SizedBox(
            height: 450,
            child: ListView.builder(
              itemCount: widget.matchedLanguages.length,
              itemBuilder: (context, index) {
                return TranslatorLanguageCheckbox(
                  language: widget.matchedLanguages[index].language,
                  isChecked: widget.matchedLanguages[index].isChecked,
                  onChanged: setCheckboxState,
                );
              },
            ),
          ),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                right: 20.0,
                bottom: 10.0,
                left: 20.0,
              ),
              child: Text(
                'Salva',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            onPressed: () {
              print('on pressed');
            },
          ),
        ],
      ),
    );
  }
}
