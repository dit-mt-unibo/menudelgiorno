import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantTranslationCardQrCodeButton extends StatelessWidget {
  const RestaurantTranslationCardQrCodeButton({
    Key? key,
    required this.translationId,
  }) : super(key: key);

  final int translationId;

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        primary: const Color.fromARGB(255, 147, 19, 19),
      ),
      child: const Text(
        'QRCODE',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      onPressed: () {
        final url = "http://10.0.2.2:8000/qrcodes/$translationId";
        _launchInBrowser(url);
      },
    );
  }
}
