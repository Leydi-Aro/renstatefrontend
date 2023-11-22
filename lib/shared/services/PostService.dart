
import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:renstatefrontend/models/PostRequest.dart';
import 'package:renstatefrontend/shared/services/MediaService.dart';
import 'package:renstatefrontend/shared/services/UserService.dart';

import '../../models/Post.dart';
import 'package:http/http.dart' as http;

class PostService {

  UserService userService = UserService();
  late MediaService mediaService = MediaService();
  final String apiUrl;

  PostService():this.apiUrl='http://192.168.18.15:8080/api/posts';
  //PostService():this.apiUrl='https://roomrest.azurewebsites.net/api/posts';


  createPost(PostRequest postRequest, List<File> _images) async {

    final userId = await userService.getUserLogedId();
    postRequest.author_id =  userId as int;

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(postRequest.toJson()),
    );

    if (response.statusCode == 201) {
      Fluttertoast.showToast(msg: 'Post created successfully',
          toastLength: Toast.LENGTH_SHORT);
      print(postRequest.toString());

    } else {
      print('Error creating post: ${response.statusCode}');
      Fluttertoast.showToast(msg: 'Error creating post',
          toastLength: Toast.LENGTH_SHORT);

    }
  }



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