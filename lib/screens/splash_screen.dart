import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);

  Widget _loginButton() {
    return Expanded(
      //width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          // Insert function here
          //validateProcessloginForm();
          Navigator.pushNamed(context, "/login");
        },
        color: accentColor,
        //color: Colors.green[500],
        padding: EdgeInsets.all(15.0),
        elevation: 10.0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Expanded(
      //width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          // Insert function here
          // validateProcessloginForm();
          Navigator.pushNamed(context, "/register");
        },
        color: accentColor,
        padding: EdgeInsets.all(15.0),
        elevation: 10.0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 30.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pomegranate_banner.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 200.0, 20.0, 20.0),
                  child: Text(
                    'Welcome to the East African Seed Company',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 150.0,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: <Widget>[
                        _loginButton(),
                        SizedBox(
                          width: 10.0,
                        ),
                        _registerButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
