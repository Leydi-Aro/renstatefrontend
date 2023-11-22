
import 'dart:convert';

import '../../models/Post.dart';
import 'package:http/http.dart' as http;

class PostService {
  final String apiUrl;

  PostService():this.apiUrl='http://localhost:8080/api/posts';
  //PostService():this.apiUrl='https://roomrest.azurewebsites.net/api/posts';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(utf8.decode(response.bodyBytes));
      return jsonData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts");
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