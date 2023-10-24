import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/search_page.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:renstatefrontend/shared/buttonApp.dart';
import 'package:renstatefrontend/ui-mesagge/receivedMessages.dart';

import '../shared/showImageProfile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String id = 'profile_view';


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 7, 64, 129),
      appBar: appBarApp(context),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: showImageProfile(),
                ),
                Text(
                  'Rafael LopezZ Perez',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 239, 237, 237),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  cardInfo(context, "Rafael"),
                  cardInfo(context, "Lopez Perez"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      cardInfo(context, "33"),
                      cardInfo(context, "Male"),
                    ]
                  ),
                  cardInfo(context, "rafael@gmail.com"),
                  cardInfo(context, "Here is description about of user"),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buttonApp(
                          "Save",
                              (){

                          }
                      ),
                      buttonApp(
                          "Search",
                              (){
                            Navigator.pushNamed(context, SearchPage.id);
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  buttonApp(
                      "Message",
                          (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>ReceivedMessages())
                        );
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationApp(),
    );
  }
}

Widget cardInfo(context, String info){
  final size = MediaQuery.of(context).size;

  return Card(
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: size.height * 0.02,
      ),
      child:
      Center(
        child: Text(
          info,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 12, 11, 11),
          ),
        ),
      )
    ),
  );
}