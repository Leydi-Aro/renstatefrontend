import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/search_page.dart';
import 'package:renstatefrontend/see-your-clients/ui/see_clients.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:renstatefrontend/shared/buttonApp.dart';
import 'package:renstatefrontend/ui-mesagge/messages_view.dart';

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
                seePhoto(),
                Text(
                  'Rafael Lopez Perez',
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
                          "Message",
                              (){
                            Navigator.pushNamed(context, MessagesView.id);
                          }
                      )
                    ],

                  ),
                  buttonApp("Your Clients", (){
                    Navigator.pushNamed(context, ClientsView.id);
                  })
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

Widget seePhoto(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
    child: ClipOval(
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage('https://i.ibb.co/2SRXmjC/1077114.png'),
          ),
        ),
      ),
    ),
  )
  ;
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