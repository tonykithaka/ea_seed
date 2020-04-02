import 'dart:convert';

import 'package:ea_seed/model/buyer.dart';
import 'package:ea_seed/model/crops.dart';
import 'package:ea_seed/repository/buyersRepo.dart' as buyersRepo;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferredBuyerCropsScreen extends StatefulWidget {
  @override
  _PreferredBuyerCropsScreenState createState() =>
      _PreferredBuyerCropsScreenState();
}

class _PreferredBuyerCropsScreenState extends State<PreferredBuyerCropsScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  List<Crops> allCrops = [];
  List<String> _selecteCategorys = List();

  @override
  Widget build(BuildContext context) {
    allCrops = ModalRoute.of(context).settings.arguments;

    //Fetch registered buyers
    fetchCropBuyersDetails(String cropId) async {
      var recipeClass = buyersRepo.BuyersRepo();
      var userType = "expert";
      List<Buyers> response =
          await recipeClass.FetchCropBuyers(cropId, userType);
      final SharedPreferences prefs = await _prefs;

      if (response != null) {
        setState(() {
          _isLoading = false;
          //prefs.setString("token", response.token);
          Navigator.pushNamed(context, "/cropExpertDetails",
              arguments: response);
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }

    void _onCategorySelected(bool selected, String uuid) {
      if (selected == true) {
        setState(() {
          _selecteCategorys.add(uuid);
        });
      } else {
        setState(() {
          _selecteCategorys.remove(uuid);
        });
      }
    }

    Widget CropslistBuilder(List<Crops> cropsList) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: cropsList.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                setState(() {
                  _isLoading = true;
                });
                fetchCropBuyersDetails(cropsList[index].uuid);
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
                              height: 80.0,
                              child: Image.network(
                                "http://68.183.101.224/${cropsList[index].photo}",
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Text(
                                  '${cropsList[index].name}',
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
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Icon(Icons.keyboard_arrow_right)),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          });
    }

    Widget CropSelectorBuilder(List<Crops> cropsList) {
      return ListView.builder(
          itemCount: cropsList.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              value: _selecteCategorys.contains(cropsList[index].uuid),
              onChanged: (bool selected) {
                _onCategorySelected(selected, cropsList[index].uuid);
              },
              title: Text(cropsList[index].name),
            );
          });
    }

    void loginErrorDialog(BuildContext context, String message) {
      var cupertinoAlertDialog = CupertinoAlertDialog(
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "Okay",
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return cupertinoAlertDialog;
          });
    }

    SubmitPreferedProducts(List<String> crop_ids) async {
      var buyerRepo = buyersRepo.BuyersRepo();
      List preferredCrops = [];

      for (var i = 0; i < crop_ids.length; i++) {
        preferredCrops.add(jsonEncode({"uuid": crop_ids[i]}));
      }

      PreferredCropsResponse response =
          await buyerRepo.PostPreferredCrops(preferredCrops);
      if (response.status == true) {
        loginErrorDialog(context, response.message);
      } else {
        loginErrorDialog(context, response.message);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          'Expert Products',
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 1.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          SubmitPreferedProducts(_selecteCategorys);
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Products with Experts'),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: CropSelectorBuilder(allCrops),
                    ),
                    SizedBox(
                      height: 100.0,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
