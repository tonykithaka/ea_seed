import 'package:ea_seed/model/conversations.dart';
import 'package:ea_seed/repository/conversationRepo.dart' as convoRepo;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  Color accentColor = Color.fromRGBO(3, 136, 60, 1);
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  List<Conversation> convoList = [];

  @override
  Widget build(BuildContext context) {
    convoList = ModalRoute.of(context).settings.arguments;

    fetchConversationDetails(String convoId) async {
      var convoClass = convoRepo.ConversationRepo();
      Conversation response =
          await convoClass.FetcConversationsDetails(convoId);
      final SharedPreferences prefs = await _prefs;

      if (response != null) {
        setState(() {
          _isLoading = false;
          //prefs.setString("token", response.token);
          Navigator.pushNamed(context, "/conversationDetails",
              arguments: response);
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }

    Widget RecipelistBuilder(List<Conversation> conversations) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: conversations.length,
          itemBuilder: (BuildContext context, int index) {
            return new GestureDetector(
              onTap: () {
                fetchConversationDetails(conversations[index].uuid);
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
                            child: Container(
                              height: 100.0,
                              child: Image.network(
                                "http://68.183.101.224/${conversations[index].photo}",
                              ),
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
                                  '${conversations[index].title}',
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
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Published On : ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '${conversations[index].created_at}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 10.0,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title: Text(
          'Conversations',
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
            child: RecipelistBuilder(convoList),
          ),
        ),
      ),
    );
  }
}
