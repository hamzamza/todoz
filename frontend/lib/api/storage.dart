import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<bool> putinStorage(params) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', params);
  return true;
}

Future<String?> getStroage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var toekn = await prefs.getString('token');
  return toekn;
}

Future<bool> verifyTokenAvailability() async {
  String? token = await getStroage();
  String? apiKey = dotenv.env['URL'];
  var url = Uri.parse("$apiKey/test");
  var body = json.encode({"token": token});
  var headers = {'Content-Type': 'application/json'};
  try {
    var response = await http.post(url, headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);

      print("daaaaaaaaaata");
      if (data['exists']) {
        print("existes");
        return true;
      }
    }
  } catch (e) {
    print("not exists error");
    print(e);
    return false;
  }
  print("not exists");
  return false;
}
