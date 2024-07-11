// //import 'dart:convert' as convert;
// import 'dart:convert';
// import 'dart:collection';
// import 'package:danmarket/models/post.dart';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class PostProvider extends ChangeNotifier {
//   List<dynamic> _posts = [];
//   List<dynamic> get posts => _posts;

//   //List<dynamic> posts = [];
//   //UnmodifiableListView<Post> get allSolutions => UnmodifiableListView(posts);
//   void addPost(Post post) {
//     _posts.add(post);
//     notifyListeners();
//   }

//   void fetchPost() async {
//     var url = Uri.http('127.0.0.1:8000', '/post');
//     var response = await http.get(url);
//     // if (response.statusCode == 200) {
//     //   var jsonResponse = convert.jsonDecode(response.body) as List<Post>;
//     //   posts = jsonResponse;
//     //   //posts = data.map<Post>((json) => Post.fromJson(json)).toList();
//     //   //notifyListeners();
//     // }
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
//       _posts = jsonResponse;
//       notifyListeners();
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//import 'post.dart'; // Post 모델 파일 경로를 지정하세요
import 'package:danmarket/models/post.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  PostProvider() {
    fetchPost();
  }

  void addPost(Post post) {
    _posts.add(post);
    notifyListeners();
  }

  Future<void> fetchPost() async {
    var url = Uri.http('127.0.0.1:8000', '/post');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      _posts = data.map<Post>((json) => Post.fromJson(json)).toList();
      notifyListeners();
    } else {
      // Handle error
      // print('Request failed with status: ${response.statusCode}.');
    }
  }
}
