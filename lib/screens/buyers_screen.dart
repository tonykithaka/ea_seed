import 'package:ea_seed/model/counties.dart';
import 'package:ea_seed/model/crops.dart';
import 'package:ea_seed/repository/buyersRepo.dart' as buyersRepo;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyersScreen extends StatefulWidget {
  @override
  _BuyersScreenState createState() => _BuyersScreenState();
}

class _BuyersScreenState extends State<BuyersScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;

  fetchBuyersCrops() async {
    var cropsClass = buyersRepo.BuyersRepo();
    List<Crops> response = await cropsClass.FetchCrops();
    final SharedPreferences prefs = await _prefs;

    if (response.length > 0) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, "/find_buyers", arguments: response);
      });
    } else {
      setState(() {
        _isLoading = false;
        //loginErrorDialog(context, response.message);
        //prefs.setString("token", response.token);
      });
    }
  }

  goToExpertRegistration() async {
    var countyClass = buyersRepo.BuyersRepo();
    List<County> response = await countyClass.FetchCounties();
    final SharedPreferences prefs = await _prefs;

    if (response.length > 0) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, "/buyer_registration",
            arguments: response);
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
          'Buyers',
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
                child: Column(
                  children: <Widget>[
                    Container(
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
                                    goToExpertRegistration();
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Image(
                                          height: 40.0,
                                          image: AssetImage(
                                              'assets/images/customer.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Register',
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
                                          image: AssetImage(
                                              'assets/images/find.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Find buyers',
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
                  ],
                ),
              ),
            ),
    );
  }
}
