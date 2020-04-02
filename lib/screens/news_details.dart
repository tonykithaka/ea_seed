import 'package:ea_seed/model/news.dart';
import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatefulWidget {
//

  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  @override
  Widget build(BuildContext context) {
    News newsDetails = ModalRoute.of(context).settings.arguments;
    print("photo   " + newsDetails.photo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          '${newsDetails.title}',
          style: TextStyle(
              fontFamily: 'Montserrat', color: Colors.white, fontSize: 15.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                //color: Colors.white,
                margin: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(1),
                      blurRadius: 5.0, // has the effect of softening the shadow
                      spreadRadius:
                          5.0, // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        5.0, // vertical, move down 10
                      ),
                    )
                  ],
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage(
                          "http://68.183.101.224${newsDetails.photo}")),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: new EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${newsDetails.title}',
                        style: TextStyle(
                          color: accentColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Text('${newsDetails.body}',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                            color: Colors.grey[800],
                          )),
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
