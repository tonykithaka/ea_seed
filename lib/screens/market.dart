import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          'Market',
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
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Find buyers and new market trends.',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: accentColor),
                ),
              ),
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
                              Navigator.pushNamed(context, "/buyers");
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image(
                                    height: 40.0,
                                    image: AssetImage(
                                        'assets/images/collaboration.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Buyers',
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
                              Navigator.pushNamed(
                                  context, "/marketTrendScreen");
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image(
                                    height: 40.0,
                                    image:
                                        AssetImage('assets/images/hashtag.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Market Trends',
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
