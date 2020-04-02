import 'package:ea_seed/model/login.dart';
import 'package:ea_seed/repository/authentication.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _isLoading = false;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //Full name field
  Widget _loginEmail() {
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
  Widget _loginPassword() {
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

  SignInUser(String email, String password) async {
    var authClass = auth.Authentication();
    LoginResponse response = await authClass.SignIn(email, password);
    final SharedPreferences prefs = await _prefs;

    if (response.status == true) {
      setState(() {
        _isLoading = false;
        prefs.setString("token", response.token);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          'Login',
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
                padding: EdgeInsets.fromLTRB(30.0, 150.0, 30.0, 30.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/plant.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Email Address:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    _loginEmail(),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Email Password:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    _loginPassword(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          // Insert function here
                          //validateProcessloginForm();
                          //Navigator.pushNamed(context, "/home");
                          setState(() {
                            _isLoading = true;
                          });
                          SignInUser(
                              emailController.text, passwordController.text);
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
                              Navigator.pushNamed(context, "/register");
                            },
                            child: Text(
                              'CREATE AN ACCOUNT',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
