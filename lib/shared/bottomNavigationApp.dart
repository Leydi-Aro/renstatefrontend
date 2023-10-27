
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationApp() {
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
  );
}

