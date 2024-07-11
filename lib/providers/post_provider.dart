import 'dart:collection';
import 'dart:convert' as convert;
import 'package:danmarket/models/post.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  List<dynamic> _posts = [];
  List<dynamic> get posts => _posts;

  //List<dynamic> posts = [];
  //UnmodifiableListView<Post> get allSolutions => UnmodifiableListView(posts);
  void addPost(Post post) {
    _posts.add(post);
    notifyListeners();
  }

  void fetchPost() async {
    var url = Uri.http('127.0.0.1:8000', '/post');
    var response = await http.get(url);
    // if (response.statusCode == 200) {
    //   var jsonResponse = convert.jsonDecode(response.body) as List<Post>;
    //   posts = jsonResponse;
    //   //posts = data.map<Post>((json) => Post.fromJson(json)).toList();
    //   //notifyListeners();
    // }
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      _posts = jsonResponse;
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
