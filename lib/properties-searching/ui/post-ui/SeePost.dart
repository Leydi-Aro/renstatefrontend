
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/models/Post.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:renstatefrontend/ui-profile/profile_author.dart';

import '../../../shared/services/PostService.dart';

class SeePost extends StatefulWidget {
  static String id = 'see_post';

  final int postId;
  SeePost(this.postId);

  @override
  State<SeePost> createState() => _SeePostState(postId);
}

class _SeePostState extends State<SeePost> {
  final int postId;
  _SeePostState(this.postId);

  late Future<Post> _postApi;
  late Post post;

  final _postService = PostService();

  @override
  void initState() {
    super.initState();

    _postApi = _postService.getPostById(postId);
    _postApi.then((value) => {
      post = value,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(context),
      body: FutureBuilder(
        future: _postApi,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            print(snapshot.error);
            return Text("Error");
          }else if(!snapshot.hasData){
            return Text("No data available");
          }else{
            return Center(
              child: ListView(
                children: [
                  showImage(),
                  seeProfileText(),
                  buttonReserve(),
                  infoPost(),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: bottomNavigationApp(context),
    );
  }


  Widget showImage(){
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Image(
            image: NetworkImage(
              post.imgUrl
            ),
          ),
        ),
      ),
    );
  }

  Widget seeProfileText() {
    return Center(
      child: GestureDetector(
        onTap: () {

        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: GestureDetector(
            child: Text(
              "View author profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
            onTap: (){
              Navigator.push(
                  context,
                MaterialPageRoute(builder: (context)=> ProfileAuthor())
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buttonReserve() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: TextButton(
          onPressed: () {

          },
          child: Text(
            "Reserve",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
          ),
        ),
      ),
    );
  }

  Widget infoPost(){
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Card(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showInfo("Tittle: ", post.title),
                showInfo("Description: ", post.description),
                showInfo("Characteristics: ", post.characteristics),
                showInfo("Location: ", post.location),
                showPrice(post.price.toString())

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showInfo(String tittle, String content) {
    return Wrap(
      children: [
        Text(
          tittle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Flexible(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget showPrice(String price) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Price: ",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              price,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }


}


