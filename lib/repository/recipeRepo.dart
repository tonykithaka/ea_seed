import 'dart:convert';

import 'package:ea_seed/model/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class RecipeRepo {
  Future FetchRecipes() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response =
        await http.get("http://68.183.101.224/api/recipes", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      List<Recipe> recipeList = (json.decode(response.body) as List)
          .map((i) => Recipe.fromJson(i))
          .toList();
      return recipeList;
    } else {
      print(json.decode(response.body));
    }
  }

  Future FetchRecipeDetails(String recipeId) async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response =
        await http.get("http://68.183.101.224/api/recipes/$recipeId", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map recipeResponse = json.decode(response.body);
      var recipeDetails = Recipe(
          status: recipeResponse["status"],
          name: recipeResponse["name"],
          publishedBy: recipeResponse["publishedBy"],
          photo: recipeResponse["photo"],
          instructions: recipeResponse["instructions"],
          ingredients: recipeResponse["ingredients"]);
      return recipeDetails;
    } else {
      print(json.decode(response.body));
    }
  }
}
