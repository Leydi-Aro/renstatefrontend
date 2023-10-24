
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/makePost.dart';
import 'package:renstatefrontend/properties-searching/ui/search_page.dart';
import 'package:renstatefrontend/ui-mesagge/receivedMessages.dart';
import 'package:renstatefrontend/ui-profile/profile_view.dart';

BottomNavigationBar bottomNavigationApp(BuildContext context) {

  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.black,
    selectedFontSize: 14.0,
    unselectedFontSize: 14.0,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 28),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search, size: 28),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add, size: 28),
        label: 'Add',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message, size: 28),
        label: 'Message',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 28),
        label: 'Profile',
      ),
    ],
    onTap: (int index) {
      switch (index) {
        case 0:
          break;
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> SearchPage())
          ); break;
        case 2:
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MakePost())
          ); break;
        case 3:
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> ReceivedMessages())
          ); break;
        case 4:
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>ProfileView())
          );break;
        default:
          print("Index not found: $index");
      }
    },

  );
}

