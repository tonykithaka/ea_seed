import 'package:ea_seed/model/recipe.dart';
import 'package:ea_seed/repository/recipeRepo.dart' as recipeRepo;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;

  fetchRecipes() async {
    var recipeClass = recipeRepo.RecipeRepo();
    List<Recipe> response = await recipeClass.FetchRecipes();
    final SharedPreferences prefs = await _prefs;

    if (response.length > 0) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, "/allRecipes", arguments: response);
      });
    } else {
      setState(() {
        _isLoading = false;
        //loginErrorDialog(context, response.message);
        //prefs.setString("token", response.token);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: accentColor,
          title: Text(
            'Recipe',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 1.0),
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: RaisedButton(
                                padding: EdgeInsets.all(10.0),
                                color: Colors.white,
                                onPressed: () {},
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Image(
                                        height: 40.0,
                                        image: AssetImage(
                                            'assets/images/add_recipe.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'Add Recipe',
                                      style: TextStyle(
                                          color: accentColor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              flex: 1,
                              child: RaisedButton(
                                padding: EdgeInsets.all(10.0),
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  fetchRecipes();
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Image(
                                        height: 40.0,
                                        image: AssetImage(
                                            'assets/images/soup.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'View Recipes',
                                      style: TextStyle(
                                          color: accentColor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
