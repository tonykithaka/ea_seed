import 'package:flutter/material.dart';

class MarketTrendScreen extends StatefulWidget {
  @override
  _MarketTrendScreenState createState() => _MarketTrendScreenState();
}

class _MarketTrendScreenState extends State<MarketTrendScreen> {
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
                              Navigator.pushNamed(context, "/whatsTrending");
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
                                  "What's Trending",
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
                            onPressed: () {},
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image(
                                    height: 40.0,
                                    image: AssetImage(
                                        'assets/images/information.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Market Information',
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
