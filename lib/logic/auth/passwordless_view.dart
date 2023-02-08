import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:projectx/utils/endpoints.dart';

class RegistrationView with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> passwordless(String email) async {
    try {
      http.Response response =
          await http.post(Uri.parse(Endpoints.passwordless),
              headers: {
                "Content-Type": "application/json",
              },
              body: json.encode({
                "email": email,
                "connection_type": "passwordless",
              }));
      var data = json.decode(response.body) as Map;
      if (data.containsKey("token")) {
        storage.setItem("token", [data['token'], email]);
        print("${storage.getItem("token")}");
        return true;
      }
      print("{ Networkerror: $data }");
      return false;
    } catch (e) {
      print("{ error: $e }");
      return false;
    }
  }
}
