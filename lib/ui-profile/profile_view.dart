import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/post-ui/YourPosts.dart';
import 'package:renstatefrontend/see-your-clients/ui/see_clients.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:renstatefrontend/shared/buttonApp.dart';
import 'package:renstatefrontend/ui-initial-section/login_view.dart';

import '../models/User.dart';
import '../shared/services/UserService.dart';
import '../shared/showImageProfile.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  late Future<User> _userApi;
  late User user;

  final userService = UserService();

  @override
  void initState() {
    super.initState();

    _userApi = userService.getUserById(1);
    _userApi.then((value) => {
      user = value,
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 7, 64, 129),
      appBar: appBarApp(context),

      body:FutureBuilder(
        future: _userApi,
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: showImageProfile(),
                      ),
                      Text(
                        user.name+" "+user.lastName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 239, 237, 237),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          cardInfo(context, user.name),
                          cardInfo(context, user.lastName),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                cardInfo(context, user.age.toString()),
                                cardInfo(context, user.gender),
                              ]
                          ),
                          cardInfo(context, user.email),
                          cardInfo(context, "Here is description about of user"),
                          SizedBox(height: 20.0,),
                          FractionallySizedBox(
                            widthFactor: 0.5,
                            child: buttonApp(
                                "LogOut",
                                    (){
                                  this.userService.removeUserLogedId();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginView()),
                                  );
                                }
                            ),
                          ),
                          SizedBox(height: 5,),
                          FractionallySizedBox(
                            widthFactor: 0.5,
                            child: buttonApp(
                                "Your Clients",
                                    (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=>ClientsView()));
                                }),
                          ),
                          SizedBox(height: 5,),
                          FractionallySizedBox(
                            widthFactor: 0.5,
                            child: buttonApp(
                                "Your Posts",
                                    (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=>YourPosts(3)));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: bottomNavigationApp(context),
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
        vertical: 15,
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