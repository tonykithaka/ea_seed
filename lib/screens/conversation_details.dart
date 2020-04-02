import 'package:ea_seed/model/conversations.dart';
import 'package:flutter/material.dart';

class ConversationDetailsScreen extends StatefulWidget {
  @override
  _ConversationDetailsScreenState createState() =>
      _ConversationDetailsScreenState();
}

class _ConversationDetailsScreenState extends State<ConversationDetailsScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  @override
  Widget build(BuildContext context) {
    Conversation convoDetails = ModalRoute.of(context).settings.arguments;
    //print("photo   " + convoDetails.photo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          '${convoDetails.title}',
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
                margin: new EdgeInsets.all(20.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(1),
                      blurRadius: 1.0, // has the effect of softening the shadow
                      spreadRadius:
                          1.0, // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        1.0, // vertical, move down 10
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
                          "http://68.183.101.224${convoDetails.photo}")),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(1),
                      blurRadius: 1.0, // has the effect of softening the shadow
                      spreadRadius:
                          1.0, // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        1.0, // vertical, move down 10
                      ),
                    )
                  ],
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                width: MediaQuery.of(context).size.width,
                margin: new EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        '${convoDetails.title}',
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
                      margin: EdgeInsets.all(20.0),
                      child: Text('${convoDetails.body}',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                            color: Colors.grey[800],
                          )),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
