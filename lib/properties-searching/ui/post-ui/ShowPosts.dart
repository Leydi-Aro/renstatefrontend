import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/post-ui/SeePost.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';

import '../../../models/Post.dart';
import '../../../shared/services/PostService.dart';


class ShowPosts extends StatefulWidget {
  final String category;

  ShowPosts(this.category);

  @override
  State<ShowPosts> createState() => _ShowPostsState(category);
}


class _ShowPostsState extends State<ShowPosts> {

  final String category;

  _ShowPostsState(this.category);

  final postService = PostService();
  late Future<List<Post>> _posts;
  late List<Post> postsList;
  late List<Post> filterPosts;
  TextEditingController _searchController = TextEditingController();


  @override
  void initState() {

    postsList = [];

    super.initState();
    _posts = postService.getPosts();

    if(category != '') {
      _posts = _posts.then((posts) {
        postsList = posts.where((post) => post.category == category).toList();

        filterPosts = postsList;
        _searchController.addListener(searchDesign);

        return postsList;
      });
    }


  }
  Widget searchDesign() {


    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Column(
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
            controller: _searchController,
            style: TextStyle(fontFamily: 'Inter'),
            maxLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (search){
              setState(() {

              });
            },
          ),



        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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

              filterPosts = searching(snapshot.data!);
              return Column(
                children: [
                  categoryResult(category),
                  searchDesign(),
                  Expanded(
                      child: ListView.builder(
                        itemCount: filterPosts.length,
                          itemBuilder: (context, index){
                          return Padding(padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: viewPost(context, filterPosts[index]),
                          );
                          },
                      ),
                  ),
                ],
              );
            }
          },
      ),
      bottomNavigationBar: bottomNavigationApp(context),
    );
  }


  List<Post> searching(List<Post> posts) {
    String searchTerm = _searchController.text.toLowerCase();
    print(searchTerm);
    filterPosts = postsList.where((post){
      return
        post.description.toLowerCase().contains(searchTerm) ||
      post.title.toLowerCase().contains(searchTerm) ||
      post.characteristics.toLowerCase().contains(searchTerm) ||
      post.location.toLowerCase().contains(searchTerm);
    }).toList();
    return filterPosts;
  }

  List<Widget> _listPosts(List<Post>data){
    List<Widget> posts = [];
    posts.add(categoryResult(data[0].category));
    posts.add(searchDesign());
    for (var post in data){
      posts.add(
        Center(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: viewPost(context, post),
              ),
            ],
          ),
        ),
      );
    }
    return posts;
  }
}

Widget viewPost(BuildContext context, Post post) {
  return FractionallySizedBox(
    widthFactor: 0.9,
    child: Card(
      color: Color(0xFF064789),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleCard(post),
              SizedBox(height: 15.0),
              FractionallySizedBox(
                widthFactor: 0.5,
                child: Image(
                  image: NetworkImage(post.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                post.description,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0,),
              buttonDetails(context, post.id)
            ],
          ),
      ),
    ),
  );
}


Widget titleCard(Post post){

  return Row(
    children: [
      Expanded(
        child: Text(
          post.title,
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          'S/ ' + post.price.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}



Widget categoryResult(String category) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Text(
      category.toUpperCase()+'S',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w900,
        letterSpacing: 0.52,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget buttonDetails(context, int postId) {
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
            MaterialPageRoute(builder: (context)=>SeePost(postId))
        );
      },
    ),
  );
}