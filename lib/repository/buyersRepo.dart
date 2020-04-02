import 'dart:convert';
import 'dart:io';

import 'package:ea_seed/model/buyer.dart';
import 'package:ea_seed/model/counties.dart';
import 'package:ea_seed/model/crops.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class BuyersRepo {
  Future FetchCrops() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response =
        await http.get("http://68.183.101.224/api/crops", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      List<Crops> cropsList = (json.decode(response.body) as List)
          .map((i) => Crops.fromJson(i))
          .toList();
      return cropsList;
    } else {
      print(json.decode(response.body));
    }
  }

  Future FetchCropBuyers(String cropId, String userType) async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response = await http
        .get("http://68.183.101.224/api/crops/${cropId}/${userType}", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      List<Buyers> buyersList = (json.decode(response.body) as List)
          .map((i) => Buyers.fromJson(i))
          .toList();
      return buyersList;
    } else {
      print(json.decode(response.body));
    }
  }

  Future FetchCounties() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response =
        await http.get("http://68.183.101.224/api/counties", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      List<County> countyList = (json.decode(response.body) as List)
          .map((i) => County.fromJson(i))
          .toList();
      return countyList;
    } else {
      print(json.decode(response.body));
    }
  }

  Future PostPreferredCrops(List allPreferredCrops) async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    List<dynamic> data = allPreferredCrops;
    print("List is  :: ${data}");
    var response = await http.post("http://68.183.101.224/api/crops",
        body: data.toString(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      Map preferredCropsResponse = json.decode(response.body);
      var test = PreferredCropsResponse(
          status: preferredCropsResponse["status"],
          type: preferredCropsResponse["type"],
          message: preferredCropsResponse["message"]);
      return test;
    } else {
      print(json.decode(response.body));
    }
  }

  Future Test(List allPreferredCrops) async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request =
        await httpClient.postUrl(Uri.parse("http://68.183.101.224/api/crops"));
    request.headers.set('content-type', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');
    request.headers.add('body', allPreferredCrops);
    print("payload ::::: (${allPreferredCrops})");
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
    httpClient.close();

    if (response.statusCode == 200) {
      Map preferredCropsResponse = json.decode(reply);
      var test = PreferredCropsResponse(
          status: preferredCropsResponse["status"],
          type: preferredCropsResponse["type"],
          message: preferredCropsResponse["message"]);
      return test;
    } else {
      print(json.decode(reply));
    }
  }

  Future RegisterUserCounty(String selection, String usertype) async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    Map data = {"county": selection};
    var response = await http.post(
        "http://68.183.101.224/api/account/${usertype}",
        body: data,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      Map preferredCropsResponse = json.decode(response.body);
      var test = PreferredCropsResponse(
          status: preferredCropsResponse["status"],
          type: preferredCropsResponse["type"],
          message: preferredCropsResponse["message"]);
      return test;
    } else {
      print(json.decode(response.body));
    }
  }

  Future RegisterBuyerCounty(
      String selection, String usertype, String qty) async {
    int quantity = int.parse(qty);
    print(quantity);
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    Map data = {"county": selection, "qty": qty};
    var response = await http.post(
        "http://68.183.101.224/api/account/${usertype}",
        body: data,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      Map preferredCropsResponse = json.decode(response.body);
      var test = PreferredCropsResponse(
          status: preferredCropsResponse["status"],
          type: preferredCropsResponse["type"],
          message: preferredCropsResponse["message"]);
      return test;
    } else {
      print(json.decode(response.body));
    }
  }

//  Future FetchRecipeDetails(String recipeId) async {
//    final SharedPreferences prefs = await _prefs;
//    final String token = prefs.getString("token");
//    final response =
//        await http.get("http://68.183.101.224/api/recipes/$recipeId", headers: {
//      'Content-Type': 'application/json',
//      'Accept': 'application/json',
//      'Authorization': 'Bearer $token',
//    });
//
//    if (response.statusCode == 200) {
//      Map recipeResponse = json.decode(response.body);
//      var recipeDetails = Recipe(
//          status: recipeResponse["status"],
//          name: recipeResponse["name"],
//          publishedBy: recipeResponse["publishedBy"],
//          photo: recipeResponse["photo"],
//          instructions: recipeResponse["instructions"],
//          ingredients: recipeResponse["ingredients"]);
//      return recipeDetails;
//    } else {
//      print(json.decode(response.body));
//    }
//  }
}
