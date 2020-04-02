import 'package:ea_seed/model/crops.dart';
import 'package:ea_seed/model/news.dart';
import 'package:ea_seed/repository/buyersRepo.dart' as buyersRepo;
import 'package:ea_seed/repository/farmingRepo.dart' as farmingRepo;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmingTips extends StatefulWidget {
  @override
  _FarmingTipsState createState() => _FarmingTipsState();
}

class _FarmingTipsState extends State<FarmingTips> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;

  fetchFarmingTips() async {
    var farmingClass = farmingRepo.FarmingRepo();
    List<News> response = await farmingClass.FetchFarmingTips();
    final SharedPreferences prefs = await _prefs;

    if (response.length > 0) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, "/allFramingTips", arguments: response);
      });
    } else {
      setState(() {
        _isLoading = false;
        //loginErrorDialog(context, response.message);
        //prefs.setString("token", response.token);
      });
    }
  }

  fetchBuyersCrops() async {
    var cropsClass = buyersRepo.BuyersRepo();
    List<Crops> response = await cropsClass.FetchCrops();
    final SharedPreferences prefs = await _prefs;

    if (response.length > 0) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, "/find_expert", arguments: response);
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
          'Farming Tips',
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
                              onPressed: () {
                                setState(() {
                                  _isLoading = true;
                                });
                                fetchFarmingTips();
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Image(
                                      height: 40.0,
                                      image: AssetImage(
                                          'assets/images/instructions.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'How to',
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
                                fetchBuyersCrops();
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Image(
                                      height: 40.0,
                                      image:
                                          AssetImage('assets/images/find.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Find Expert',
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
            ),
    );
  }
}
