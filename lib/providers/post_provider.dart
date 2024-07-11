import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
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
      //Handle error
      //print('Request failed with status: ${response.statusCode}.');
    }
  }
}
