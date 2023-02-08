// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:projectx/models/profile/profile_model.dart';
import 'package:projectx/utils/endpoints.dart';

class UpdateProfileView with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> updateProfile(
    File? picture,
    String? email,
    String? phoneVerified,
    String? phone,
    String? occupation,
    String? lastName,
    String? firstName,
    String? full_name,
  ) async {
    var headers = {
      "Authorization": "Bearer ${storage.getItem('credential')}",
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest('PATCH', Uri.parse(Endpoints.profile));
    request.fields.addAll({
      "email": email!,
      "phone_verified": phoneVerified!,
      "phone": phone!,
      "occupation": occupation!,
      "last_name": lastName!,
      "first_name": firstName!,
      "full_name": full_name!,
    });
    request.files
        .add(await http.MultipartFile.fromPath('picture', picture!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfileOccupation(
    String? occupation,
  ) async {
    try {
      http.Response response = await http.patch(Uri.parse(Endpoints.profile),
          headers: {
            "Authorization": "Bearer ${storage.getItem('credential')}",
            "Content-Type": "application/json",
          },
          body: json.encode({
            "occupation": occupation,
          }));
      var data = json.decode(response.body) as Map;
      if (data.containsKey("occupation")) {
        print(data["occupation"].toString());
      }
      return true;
    } catch (e) {
      log(e.toString());
      print(e);
      return false;
    }
  }

  Future<bool> updateProfileEmail(
    String? email,
  ) async {
    try {
      http.Response response = await http.patch(Uri.parse(Endpoints.profile),
          headers: {
            "Authorization": "Bearer ${storage.getItem('credential')}",
            "Content-Type": "application/json",
          },
          body: json.encode({
            "email": email,
          }));
      var data = json.decode(response.body) as Map;
      if (data.containsKey("occupation")) {
        print(data["occupation"].toString());
      }
      return true;
    } catch (e) {
      log(e.toString());
      print(e);
      return false;
    }
  }

  Future<bool> updateProfilePhoneVerified(
    bool? phoneVerified,
  ) async {
    try {
      http.Response response = await http.patch(Uri.parse(Endpoints.profile),
          headers: {
            "Authorization": "Bearer ${storage.getItem('credential')}",
            "Content-Type": "application/json",
          },
          body: json.encode({
            "phoneVerified": phoneVerified,
          }));
      var data = json.decode(response.body) as Map;
      if (data.containsKey("occupation")) {
        print(data["occupation"].toString());
      }
      return true;
    } catch (e) {
      log(e.toString());
      print(e);
      return false;
    }
  }

  Future<bool> updateProfilePhone(
    String? phone,
  ) async {
    try {
      http.Response response = await http.patch(Uri.parse(Endpoints.profile),
          headers: {
            "Authorization": "Bearer ${storage.getItem('credential')}",
            "Content-Type": "application/json",
          },
          body: json.encode({
            "phone": phone,
          }));
      var data = json.decode(response.body) as Map;
      if (data.containsKey("occupation")) {
        print(data["occupation"].toString());
      }
      return true;
    } catch (e) {
      log(e.toString());
      print(e);
      return false;
    }
  }

  Future<bool> updateProfileFull_name(
    String? firstname,
    String? lastname,
  ) async {
    try {
      http.Response response = await http.patch(Uri.parse(Endpoints.profile),
          headers: {
            "Authorization": "Bearer ${storage.getItem('credential')}",
            "Content-Type": "application/json",
          },
          body: json.encode({
            "lastName": lastname,
            "firstName": firstname,
          }));
      var data = json.decode(response.body) as Map;
      if (data.containsKey("occupation")) {
        print(data["occupation"].toString());
      }
      return true;
    } catch (e) {
      log(e.toString());
      print(e);
      return false;
    }
  }
}

LocalStorage storage = LocalStorage('usertoken');

Future<ProfileModel?> getProfile(context) async {
  ProfileModel? result;
  var token = storage.getItem('token');
  try {
    http.Response response = await http.get(
      Uri.parse(Endpoints.profile),
      headers: {
        "Authorization": "Bearer ${storage.getItem('credential')}",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = ProfileModel.fromJson(item);
    } else {
      print(response.statusCode.toString());
      print("Data not found");
      print("$storage.getItem('credential')");
    }
  } catch (e) {
    print(e.toString());
    log(e.toString());
  }
  return result;
}

class PostDataProvider with ChangeNotifier {
  ProfileModel data = ProfileModel();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    data = (await getProfile(context))!;
    loading = false;

    notifyListeners();
  }
}
