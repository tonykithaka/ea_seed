import 'package:ea_seed/model/recipe.dart';
import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatefulWidget {
//

  @override
  _RecipeDetailsScreenState createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  @override
  Widget build(BuildContext context) {
    Recipe recipeDetails = ModalRoute.of(context).settings.arguments;
    print("photo   " + recipeDetails.photo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          '${recipeDetails.name}',
          style: TextStyle(
              fontFamily: 'Montserrat', color: Colors.white, fontSize: 15.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
                margin: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(1),
                      blurRadius: 1.0, // has the effect of softening the shadow
                      spreadRadius:
                          1.0, // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        1.0, // vertical, move down 10
                      ),
                    )
                  ],
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage(
                          "http://68.183.101.224${recipeDetails.photo}")),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: new EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${recipeDetails.name}',
                        style: TextStyle(
                          color: accentColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.white,
                      padding: EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300].withOpacity(1),
                            blurRadius:
                                1.0, // has the effect of softening the shadow
                            spreadRadius:
                                1.0, // has the effect of extending the shadow
                            offset: Offset(
                              0.0, // horizontal, move right 10
                              1.0, // vertical, move down 10
                            ),
                          )
                        ],
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Ingredients',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: accentColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              '${recipeDetails.ingredients}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.white,
                      padding: new EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300].withOpacity(1),
                            blurRadius:
                                1.0, // has the effect of softening the shadow
                            spreadRadius:
                                1.0, // has the effect of extending the shadow
                            offset: Offset(
                              0.0, // horizontal, move right 10
                              1.0, // vertical, move down 10
                            ),
                          )
                        ],
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Instructions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: accentColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text('${recipeDetails.instructions}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14.0,
                                  color: Colors.grey[800],
                                )),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
