import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final createUserFormKey = new GlobalKey<FormState>();

  String fullName;
  String email;
  String location;
  String password;
  String repeatPassword;

  //Full name field
  Widget _fullNameCreateField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your full name" : null,
      onSaved: (val) => fullName = val,
      style: TextStyle(
          color: Color.fromRGBO(255, 210, 65, 1),
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          height: 2.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(51, 51, 51, 1),
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(top: 20.0, bottom: 25.0, left: 0, right: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          Icons.account_circle,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
        hintText: 'Enter your full name',
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
      ),
    );
  }

  //Email Field
  Widget _emailCreateField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your email" : null,
      onSaved: (val) => email = val,
      style: TextStyle(
          color: Color.fromRGBO(255, 210, 65, 1),
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          height: 2.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(51, 51, 51, 1),
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(top: 20.0, bottom: 25.0, left: 0, right: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          Icons.email,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
        hintText: 'Enter your email',
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
      ),
    );
  }

  //Location field
  Widget _locationCreateField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your home location" : null,
      onSaved: (val) => location = val,
      style: TextStyle(
          color: Color.fromRGBO(255, 210, 65, 1),
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          height: 2.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(51, 51, 51, 1),
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(top: 20.0, bottom: 25.0, left: 0, right: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          Icons.add_location,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
        hintText: 'Enter your home location',
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
      ),
    );
  }

  //Password field
  Widget _passwordCreateField() {
    return TextFormField(
      validator: (val) =>
          val.length == 0 || val == "" ? "Enter your password" : null,
      onSaved: (val) => password = val,
      obscureText: true,
      style: TextStyle(
          color: Color.fromRGBO(255, 210, 65, 1),
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          height: 2.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(51, 51, 51, 1),
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(top: 20.0, bottom: 25.0, left: 0, right: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
        hintText: 'Enter your password',
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
      ),
    );
  }

  //Repeat password field
  Widget _repeatPasswordField() {
    return TextFormField(
      validator: (val) =>
          val.length == 0 || val == "" ? "Repeat your password" : null,
      onSaved: (val) => repeatPassword = val,
      obscureText: true,
      style: TextStyle(
          color: Color.fromRGBO(255, 210, 65, 1),
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          height: 2.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(51, 51, 51, 1),
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(top: 20.0, bottom: 25.0, left: 0, right: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
        hintText: 'Repeat your password',
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
          color: Color.fromRGBO(255, 210, 65, 1),
        ),
      ),
    );
  }

  //Validate Form and save
  validateProcessloginForm() {
    print('Validating login form...');
    if (createUserFormKey.currentState.validate()) {
      print("Validation successfull");
      createUserFormKey.currentState.save();
//      print('login email : $loginEmail');
//      print('login password : $loginPassword');
      Navigator.pushReplacementNamed(context, "/");
    } else {
      print("Validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: ,
        //resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 30.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/plant.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    color: Color.fromRGBO(51, 51, 51, 1)),
              ),
              SizedBox(
                width: 60.0,
                height: 50.0,
                child: Divider(
                    thickness: 3.0, color: Color.fromRGBO(51, 51, 51, 1)),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Please enter the following information to create an account.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                      color: Color.fromRGBO(51, 51, 51, 1),
                      height: 1.5),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Form(
                key: createUserFormKey,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      _fullNameCreateField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _emailCreateField(),
                      SizedBox(
                        height: 10.0,
                      ),
//                      _locationCreateField(),
//                      SizedBox(
//                        height: 10.0,
//                      ),
                      _passwordCreateField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _repeatPasswordField(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    // Insert function here
                    validateProcessloginForm();
                  },
                  color: Color.fromRGBO(255, 210, 65, 1),
                  padding: EdgeInsets.all(15.0),
                  elevation: 10.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(51, 51, 51, 1),
                          letterSpacing: 0,
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
                    Text(
                      'Got an account?',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(51, 51, 51, 1),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 210, 65, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Align(
                  child: Text(
                    'Created by Tony Kithaka',
                    style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(51, 51, 51, 0.6),
                        letterSpacing: 1.0),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
