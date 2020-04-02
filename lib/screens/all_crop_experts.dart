import 'package:ea_seed/model/buyer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllSeedExpertsScreen extends StatefulWidget {
  @override
  _AllSeedExpertsScreenState createState() => _AllSeedExpertsScreenState();
}

class _AllSeedExpertsScreenState extends State<AllSeedExpertsScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  List<Buyers> buyersList = [];

  @override
  Widget build(BuildContext context) {
    buyersList = ModalRoute.of(context).settings.arguments;

    Widget RecipelistBuilder(List<Buyers> buyerList) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: buyerList.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                //Insert new function here
              },
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
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
                                  '${buyersList[index].name}',
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
                                        'Expert Email : ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '${buyersList[index].email}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )),
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
                                        'Expert Phone : ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '${buyersList[index].phone}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )),
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
                                        'Expert Country : ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '${buyersList[index].country}',
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
          'All Experts',
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
            child: RecipelistBuilder(buyersList),
          ),
        ),
      ),
    );
  }
}
