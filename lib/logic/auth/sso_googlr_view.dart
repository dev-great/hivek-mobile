import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:projectx/utils/endpoints.dart';

class SSOGoogleView with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> ssoGoogle(
    String email,
  ) async {
    try {
      http.Response response = await http.post(Uri.parse(Endpoints.verifyOTP),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "email": email,
            "connection_type": "passwordless",
          }));
      var data = json.decode(response.body) as Map;
      if (data.containsKey("credential")) {
        storage.setItem("credential", data['token']);
        print(storage.getItem('credential'));
        return true;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
