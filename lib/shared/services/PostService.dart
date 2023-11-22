
import 'dart:convert';

import '../../models/Post.dart';
import 'package:http/http.dart' as http;

class PostService {
  final String apiUrl;

  PostService():this.apiUrl='http://192.168.18.15:8080/api/posts';
  //PostService():this.apiUrl='https://roomrest.azurewebsites.net/api/posts';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Post> postsList = jsonList.map((json) => Post.fromJson(json)).toList();
      return postsList;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> getPostById(int postId) async {
    final postUrl = '$apiUrl/$postId';
    final response = await http.get(Uri.parse(postUrl));

    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(utf8.decode(response.bodyBytes));
      return Post.fromJson(jsonData);
    } else {
      throw Exception("Failed to load post");
    }
  }

}