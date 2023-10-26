import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/see_post.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';

import '../../models/post.dart';
import '../../shared/services/PostService.dart';


class ShowPosts extends StatefulWidget {
  const ShowPosts({super.key});

  @override
  State<ShowPosts> createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {

  final postService = PostService();
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = postService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarApp(context),
      body: FutureBuilder(
          future: _posts,
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No posts available.'));
            }else{
              return Center(
                child: GridView.count(
                  crossAxisCount: 1,
                  children: _listPosts(snapshot.data!),
                ),
              );
            }
          },
      ),

      bottomNavigationBar: bottomNavigationApp(context),
    );
  }

  List<Widget> _listPosts(List<Post>data){
    List<Widget> posts = [];
    for (var post in data){
      posts.add(
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        viewPost(context, post),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      );
    }
    return posts;
  }
}


Widget searchDesign() {
  return Column(
    children: [
      Text(
        'Search',
        style: TextStyle(
          color: Color(0xFF064789),
          fontSize: 36,
          fontWeight: FontWeight.w400,
        ),
      ),
      TextField(
        style: TextStyle(fontFamily: 'Inter'),
        maxLines: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    ],
  );
}

Widget tittleResult() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Text(
      'ALL RESULTS',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w900,
        letterSpacing: 0.52,
      ),
    ),
  );
}

Widget viewPost(BuildContext context, Post post) {
  return Card(
    color: Color(0xFF064789),
    elevation: 5,
    child: ListView(
      shrinkWrap: true,
      children: [
        Padding(padding: EdgeInsets.all(3)),
        Center(
          child: Text(
            post.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.55,
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Center(
          child: Text(
            'S/. ' + post.price.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.52,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(5)),
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Image(
              image: NetworkImage(post.imgUrl),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
              post.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Center(
          child: buttonDetails(context),
        ),
      ],
    ),
  );
}

Widget buttonDetails(context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextButton(
      child: Text(
        'Detalles',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.52,
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SeePost())
        );
      },
    ),
  );
}