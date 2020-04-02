import 'package:ea_seed/model/news.dart';
import 'package:ea_seed/repository/newsRepo.dart' as newsRepo;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  List<News> newslets = [];

  @override
  Widget build(BuildContext context) {
    newslets = ModalRoute.of(context).settings.arguments;

    fetchNewsDetails(String newsId) async {
      var newsClass = newsRepo.NewsRepo();
      News response = await newsClass.FetchNewsDetails(newsId);
      final SharedPreferences prefs = await _prefs;

      if (response.status == true) {
        setState(() {
          _isLoading = false;
          print("Title" + response.title);
          print("Photo" + response.photo);
          //prefs.setString("token", response.token);
          Navigator.pushNamed(context, "/newsDetails", arguments: response);
        });
      } else {
        setState(() {
          _isLoading = false;
          //loginErrorDialog(context, response.message);
          //prefs.setString("token", response.token);
        });
      }
    }

    Widget NewslistBuilder(List<News> newslets) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: newslets.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                fetchNewsDetails(newslets[index].uuid);
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
                            child: Image.network(
                              "http://68.183.101.224/${newslets[index].photo}",
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Text(
                                  '${newslets[index].title}',
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
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                height: 50.0,
                                child: Text(
                                  '${newslets[index].body}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14.0,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Text(
                                  '${newslets[index].created_at}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 10.0,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          });
    }

    //${newslets[index].title}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          'News',
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
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: NewslistBuilder(newslets),
          ),
        ),
      ),
    );
  }
}
