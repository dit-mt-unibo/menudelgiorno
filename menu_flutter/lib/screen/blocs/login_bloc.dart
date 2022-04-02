import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  final stream = BehaviorSubject<Map<String, dynamic>>();

  void doLogin(Map params) async {
    await http
        .post(Uri.parse("http://10.0.2.2:8000/api/auth/login"),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
            body: jsonEncode(params))
        .then((value) {
      // print(value.body);
      stream.add(jsonDecode(value.body));
    }).catchError((onError) => {print(onError)});
  }

  @override
  void dispose() {
    stream.close();
    super.dispose();
  }
}
