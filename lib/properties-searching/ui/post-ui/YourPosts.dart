import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';

class YourPosts extends StatefulWidget {
  const YourPosts({super.key});
  static String id = 'posts_list';

  @override
  State<YourPosts> createState() => _YourPostsState();
}

class _YourPostsState extends State<YourPosts> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appBarApp(context),
      body: Center(
        child: ListView(
          children: [
            title(),
            showPosts(),
            buttonBack(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationApp(context),
    );
  }
}

Widget title() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        "Your Posts",
        style: TextStyle(
          color: Color(0xFF064789),
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
        ),
      ),
    ),
  );
}

Widget buttonBack(){
  return FractionallySizedBox(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () {

        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF064789)),
        ),
        child: Text(
          "Back",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}


Widget showPosts() {
  final cardColor = Color(0xFF064789);
  return Card(
    color: cardColor,
    margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 180.0),
            child: Text(
              'Table con filter y paginator, puede editar y eliminar',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}