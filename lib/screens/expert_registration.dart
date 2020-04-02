import 'package:ea_seed/model/counties.dart';
import 'package:ea_seed/model/crops.dart';
import 'package:ea_seed/repository/buyersRepo.dart' as buyersRepo;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpertRegisterScreen extends StatefulWidget {
  @override
  _ExpertRegisterScreenState createState() => _ExpertRegisterScreenState();
}

class _ExpertRegisterScreenState extends State<ExpertRegisterScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  List<County> allCounties = [];
  String _mySelection;
  bool _isLoading = false;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //Full name field
  Widget _registerFullName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your full name" : null,
      //onSaved: (val) => fullName = val,
      style: TextStyle(
          color: accentColor,
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          height: 2.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(top: 10.0, bottom: 15.0, left: 0, right: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        prefixIcon: Icon(
          Icons.account_circle,
          color: accentColor,
        ),
        hintText: 'Enter your full name',
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          color: accentColor,
        ),
      ),
    );
  }

  Widget _regPreferCop() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLoading = true;
        });
        fetchPreferredCrops();
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Text('Set up your preference crops'),
              Icon(Icons.keyboard_arrow_right)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }

  //buying quantity
  Widget _registerQuatityTobuy() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter quantity to buy" : null,
      //onSaved: (val) => fullName = val,
      style: TextStyle(
          color: accentColor,
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          height: 2.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(top: 10.0, bottom: 15.0, left: 15.0, right: 15.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: 'Minimum quatity to buy',
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          color: accentColor,
        ),
      ),
    );
  }

  fetchPreferredCrops() async {
    var cropsClass = buyersRepo.BuyersRepo();
    List<Crops> response = await cropsClass.FetchCrops();
    final SharedPreferences prefs = await _prefs;

    if (response.length > 0) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, "/fetch_prefered_crops",
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

  getSelectedCounty(String selection) async {
    var buyerRepo = buyersRepo.BuyersRepo();
    var userType = "expert";
    PreferredCropsResponse response =
        await buyerRepo.RegisterUserCounty(selection, userType);

    if (response.status == "Success") {
      setState(() {
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        loginErrorDialog(context, response.message);
      });
    } else {
      setState(() {
        loginErrorDialog(context, response.message);
        //loginErrorDialog(context, response.message);
        //prefs.setString("token", response.token);
      });
    }
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

  @override
  Widget build(BuildContext context) {
    allCounties = ModalRoute.of(context).settings.arguments;

    List<County> _myJson = allCounties;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          'Expert Registration',
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _regPreferCop(),
              DropdownButton<String>(
                isExpanded: true,
                hint: Text('Select County'),
                value: _mySelection,
                items: _myJson.map((County county) {
                  return DropdownMenuItem<String>(
                    value: county.uuid,
                    child: Text(
                      county.name,
                      style: TextStyle(color: accentColor),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _mySelection = newValue;
                  });
                },
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: accentColor),
                underline: Container(
                  height: 1,
                  color: accentColor,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              _registerQuatityTobuy(),
              SizedBox(
                height: 15.0,
              ),
              // _registerEmail(),

              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    getSelectedCounty(_mySelection);
                    // Insert function here
                  },
                  color: accentColor,
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 15.0),
                  elevation: 10.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
//                      Image.asset('assets/go_arrow.png')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
