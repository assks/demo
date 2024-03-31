import 'dart:convert';


import 'package:http/http.dart' as http;

import '../../modals/datamodal.dart';

class Api {
  var client = http.Client();

  Future<List<Datamodal>> demo() async {
    var list = <Datamodal>[];
    // Get user posts for id
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;
    // loop and convert each item to Post
    for (var post in parsed) {
      list.add(Datamodal.fromJson(post));
    }
    return list;
  }
}
