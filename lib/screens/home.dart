import 'package:ea_seed/model/conversations.dart';
import 'package:ea_seed/model/news.dart';
import 'package:ea_seed/repository/conversationRepo.dart' as convoRepo;
import 'package:ea_seed/repository/newsRepo.dart' as newsRepo;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: accentColor,
            ),
            accountName: Text('EA Seed'),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/easeed_icon.png')),
          ),
          ListTile(
            title: Text(
              'News',
              style: TextStyle(
                  color: accentColor, fontFamily: 'Montserrat', fontSize: 14.0),
            ),
            onTap: () {
              setState(() {
                _isLoading = true;
              });
              fetchNews();
            },
          ),
          ListTile(
            title: Text(
              'Market',
              style: TextStyle(
                  color: accentColor, fontFamily: 'Montserrat', fontSize: 14.0),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/market");
            },
          ),
          ListTile(
            title: Text(
              'Farming Tips',
              style: TextStyle(
                  color: accentColor, fontFamily: 'Montserrat', fontSize: 14.0),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/farmingtips");
            },
          ),
          ListTile(
            title: Text(
              'Recipe',
              style: TextStyle(
                  color: accentColor, fontFamily: 'Montserrat', fontSize: 14.0),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/recipe");
            },
          ),
          ListTile(
            title: Text(
              'Conversations',
              style: TextStyle(
                  color: accentColor, fontFamily: 'Montserrat', fontSize: 14.0),
            ),
            onTap: () {
              setState(() {
                _isLoading = true;
              });
              fetchConversations();
            },
          ),
          ListTile(
            title: Text(
              'Products',
              style: TextStyle(
                  color: accentColor, fontFamily: 'Montserrat', fontSize: 14.0),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/products");
            },
          ),
        ],
      ),
    );
  }

  String token;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    //token = sharedPreferences.getString("token");
    print(token);
  }

  checkLoginStatus() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString("token") == null) {
      Navigator.pushNamed(context, "/login");
    } else {
      print("token");
      print(prefs.getString("token"));
    }
  }

  fetchNews() async {
    var newsClass = newsRepo.NewsRepo();
    List<News> response = await newsClass.FetchNews();
    final SharedPreferences prefs = await _prefs;

    if (response.length > 0) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, "/news", arguments: response);
      });
    } else {
      setState(() {
        _isLoading = false;
        //loginErrorDialog(context, response.message);
        //prefs.setString("token", response.token);
      });
    }
  }

  fetchConversations() async {
    var convoClass = convoRepo.ConversationRepo();
    List<Conversation> response = await convoClass.FetchConversations();
    final SharedPreferences prefs = await _prefs;

    if (response.length > 0) {
      setState(() {
        _isLoading = false;
        //prefs.setString("token", response.token);
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, "/conversations", arguments: response);
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
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          onPressed: () {},
//          color: Colors.white,
//        ),
        title: Text(
          'EA Seed',
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 1.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              //sharedPreferences.clear();
              //sharedPreferences.commit();
              Navigator.pushReplacementNamed(context, "/");
            },
            color: Colors.white,
          )
        ],
      ),
      drawer: drawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.all(30.0),
//                      width: double.infinity,
//                      decoration: BoxDecoration(
//                        color: accentColor,
//                      ),
//                      child: Text(
//                        'You are logged in as Tony kithaka',
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontWeight: FontWeight.w500,
//                            fontFamily: 'Montserrat'),
//                      ),
//                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      width: double.infinity,
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
                                    fetchNews();
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Image(
                                          height: 40.0,
                                          image: AssetImage(
                                              'assets/images/newspaper.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'News',
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
                                    Navigator.pushNamed(context, "/market");
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Image(
                                          height: 40.0,
                                          image: AssetImage(
                                              'assets/images/market.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Market',
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
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(10.0),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/farmingtips");
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
                                        'Farming Tips',
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
                                    Navigator.pushNamed(context, "/recipe");
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Image(
                                          height: 40.0,
                                          image: AssetImage(
                                              'assets/images/soup.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Recipe',
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
                          SizedBox(
                            height: 10.0,
                          ),
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
                                    fetchConversations();
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Image(
                                          height: 40.0,
                                          image: AssetImage(
                                              'assets/images/comments.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Conversations',
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
                                              'assets/images/seed.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Products',
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
