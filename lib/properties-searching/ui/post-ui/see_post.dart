

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:renstatefrontend/shared/buttonApp.dart';
import 'package:renstatefrontend/ui-profile/profile_author.dart';

class SeePost extends StatefulWidget {
  const SeePost({super.key});
  static String id = 'see_post';

  @override
  State<SeePost> createState() => _SeePostState();
}

class _SeePostState extends State<SeePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(context),
      body: Center(
        child: ListView(
          children: [
            showImage(),
            seeProfileText(),
            buttonReserve(),
            infoPost(),
          ],
        )
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
              'https://images.pexels.com/photos/2079246/pexels-photo-2079246.jpeg?auto=compress&cs=tinysrgb&w=600',
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
      padding: const EdgeInsets.all(20.0),
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
                showInfo("Tittle: ", "fermentum mauris, vel scelerisque"),
                showInfo("Description: ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar mi ut ante euismod tincidunt."),
                showInfo("Characteristic: ", "Caracteristica uno tetxi de caracteristicas hdgegefjfdfd"),
                showInfo("Location: ", "Caracteristica uno tetxi de caracteristicas hdgegefjfdfd"),
                showPrice("457.25")

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


