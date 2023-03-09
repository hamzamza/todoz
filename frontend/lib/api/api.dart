// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'storage.dart';

Future<void> Register(String username, String password, String email) async {
  String? apiKey = dotenv.env['URL'];
  var url = Uri.parse("$apiKey/auth/register");
  var body =
      json.encode({'username': username, 'email': email, 'password': password});
  var headers = {'Content-Type': 'application/json'};
  try {
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 203) {
      var data = json.decode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<bool> Login(String username, String password) async {
  String? apiKey = dotenv.env['URL'];
  var url = Uri.parse("$apiKey/auth/login");
  var body = json.encode({'username': username, 'password': password});
  var headers = {'Content-Type': 'application/json'};

  try {
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 203) {
      var data = json.decode(response.body);
      await putinStorage(data['token']);
      print(data['token']);
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
