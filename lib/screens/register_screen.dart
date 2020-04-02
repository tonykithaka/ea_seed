import 'package:ea_seed/model/login.dart';
import 'package:ea_seed/repository/authentication.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  String dropdownValue = '+254';
  TextEditingController fullnameController = new TextEditingController();
  TextEditingController prefixController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordasswordController =
      new TextEditingController();

  bool _isLoading = false;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //Full name field
  Widget _registerFullName() {
    return TextFormField(
      controller: fullnameController,
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

  Widget _prefixPhoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your mobile number" : null,
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
          Icons.phone,
          color: accentColor,
        ),
        hintText: 'Enter your mobile number',
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

  //Full name field
  Widget _registerPhoneNumber() {
    return TextFormField(
      controller: mobileController,
      keyboardType: TextInputType.number,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your mobile number" : null,
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
          Icons.phone,
          color: accentColor,
        ),
        hintText: 'Enter your mobile number',
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

  //Full name field
  Widget _registerEmail() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your email" : null,
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
          Icons.email,
          color: accentColor,
        ),
        hintText: 'Enter your email',
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

  //Full name field
  Widget _registerPassword() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your password" : null,
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
          Icons.lock,
          color: accentColor,
        ),
        hintText: 'Enter your password',
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

  //Full name field
  Widget _registerRepeatPassword() {
    return TextFormField(
      controller: confirmPasswordasswordController,
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length == 0 || val == "" ? "Repeat your password" : null,
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
          Icons.lock,
          color: accentColor,
        ),
        hintText: 'Repeat your password',
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

  //checkbox
  Widget _termsCheckbox() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Checkbox(value: false, onChanged: null),
          ),
          Expanded(
            flex: 7,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/register");
              },
              child: Text(
                'I agree to EA Seeds terms and conditions.',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: accentColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
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
            Navigator.pushNamed(context, "/login");
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

  SignUpUser(String fullName, String mobileNumber, String email,
      String password, String password_confirmation) async {
    var newmobile = '+254' + mobileNumber;
    var authClass = auth.Authentication();
    RegisterResponse response = await authClass.SignUp(
        fullName, newmobile, email, password, password_confirmation);
    final SharedPreferences prefs = await _prefs;

    if (response.status == true) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        Navigator.pushNamed(context, "/home");
      });
    } else {
      setState(() {
        _isLoading = false;
        loginErrorDialog(context, response.message);
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
          'Register',
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
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _registerFullName(),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: accentColor),
                            underline: Container(
                              height: 1,
                              color: accentColor,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[
                              '+254',
                              '+255',
                              '+256',
                              '+250',
                              '+257'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(flex: 5, child: _registerPhoneNumber())
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    _registerEmail(),
                    SizedBox(
                      height: 5.0,
                    ),
                    _registerPassword(),
                    SizedBox(
                      height: 5.0,
                    ),
                    _registerRepeatPassword(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _termsCheckbox(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          SignUpUser(
                              fullnameController.text,
                              mobileController.text,
                              emailController.text,
                              passwordController.text,
                              confirmPasswordasswordController.text);
                        },
                        color: accentColor,
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 15.0),
                        elevation: 10.0,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Submit',
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
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            child: Text(
                              'ALREADY REGISTERED? LOG IN',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                color: accentColor,
                              ),
                            ),
                          )
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
