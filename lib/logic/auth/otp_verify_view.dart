import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:projectx/utils/endpoints.dart';

class OTPVerifyView with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> otpVerify(
    String email,
    String token,
    String otp,
  ) async {
    try {
      http.Response response = await http.post(Uri.parse(Endpoints.verifyOTP),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "email": email,
            "token": token,
            "otp": otp,
            "connection_type": "passwordless",
          }));
      var data = json.decode(response.body) as Map;
      if (data.containsKey("token")) {
        storage.setItem("credential", data['token']);
        print(
          storage.getItem('credential'),
        );
        storage.deleteItem("token");
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
