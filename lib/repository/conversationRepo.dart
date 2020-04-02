import 'dart:convert';

import 'package:ea_seed/model/conversations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class ConversationRepo {
  Future FetchConversations() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response =
        await http.get("http://68.183.101.224/api/conversations", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      List<Conversation> convoList = (json.decode(response.body) as List)
          .map((i) => Conversation.fromJson(i))
          .toList();
      return convoList;
    } else {
      print(json.decode(response.body));
    }
  }

  Future FetcConversationsDetails(String newsId) async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString("token");
    final response = await http
        .get("http://68.183.101.224/api/conversations/$newsId", headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Map convoResponse = json.decode(response.body);
      var convoDetails = Conversation(
          uuid: convoResponse["uuid"],
          title: convoResponse["title"],
          photo: convoResponse["photo"],
          body: convoResponse["body"],
          created_at: convoResponse["created_at"]);
      return convoDetails;
    } else {
      print(json.decode(response.body));
    }
  }
}
