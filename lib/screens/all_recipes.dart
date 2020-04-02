import 'package:ea_seed/model/recipe.dart';
import 'package:ea_seed/repository/recipeRepo.dart' as recipeRepo;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllRecipeScreen extends StatefulWidget {
  @override
  _AllRecipeScreenState createState() => _AllRecipeScreenState();
}

class _AllRecipeScreenState extends State<AllRecipeScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  List<Recipe> recipeTips = [];

  @override
  Widget build(BuildContext context) {
    recipeTips = ModalRoute.of(context).settings.arguments;

    fetchFarmingTipDetails(String recipeId) async {
      var recipeClass = recipeRepo.RecipeRepo();
      Recipe response = await recipeClass.FetchRecipeDetails(recipeId);
      final SharedPreferences prefs = await _prefs;

      if (response.status == true) {
        setState(() {
          _isLoading = false;
          //prefs.setString("token", response.token);
          Navigator.pushNamed(context, "/recipeDetails", arguments: response);
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }

    Widget RecipelistBuilder(List<Recipe> newslets) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: newslets.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                fetchFarmingTipDetails(newslets[index].uuid);
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3.0),
                            child: Container(
                              height: 100.0,
                              child: Image.network(
                                "http://68.183.101.224/${newslets[index].photo}",
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Text(
                                  '${newslets[index].name}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Monserrat',
                                      fontWeight: FontWeight.w700,
                                      color: accentColor,
                                      fontSize: 14.0),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Published By : ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '${newslets[index].publishedBy}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          'How To',
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: RecipelistBuilder(recipeTips),
          ),
        ),
      ),
    );
  }
}
