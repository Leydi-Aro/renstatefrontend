import 'package:flutter/material.dart';


AppBar appBarApp(context) {
  return AppBar(
    title: Text("RoomRest", style:
    TextStyle(
      fontWeight: FontWeight.bold,

    ),),
    backgroundColor: Theme.of(context).primaryColor,
  );
}
