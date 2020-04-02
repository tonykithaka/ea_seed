import 'dart:convert';

import 'package:ea_seed/model/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Authentication {
  Future SignIn(String email, String password) async {
    print("Email is :: " + email);
    Map data = {"email": email, "password": password};
    var response =
        await http.post("http://68.183.101.224/api/login", body: data);
    if (response.statusCode == 200) {
      Map loginResponse = json.decode(response.body);
      var test = LoginResponse(
          status: loginResponse["status"],
          type: loginResponse["type"],
          message: loginResponse["message"],
          token: loginResponse["token"]);
      return test;
    } else {
      print(json.decode(response.body));
    }
  }

  //signup
  Future SignUp(String fullName, String mobileNumber, String email,
      String password, String password_confirmation) async {
    print("Email is :: " + email);
    Map data = {
      "name": fullName,
      "email": email,
      "phone": mobileNumber,
      "password": password,
      "password_confirmation": password_confirmation
    };
    var response =
        await http.post("http://68.183.101.224/api/register", body: data);
    if (response.statusCode == 200) {
      Map registerResponse = json.decode(response.body);
      var test = RegisterResponse(
          status: registerResponse["status"],
          type: registerResponse["type"],
          message: registerResponse["message"]);
      return test;
    } else {
      print(json.decode(response.body));
    }
  }
}
