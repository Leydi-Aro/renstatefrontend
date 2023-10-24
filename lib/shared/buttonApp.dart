
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buttonApp(String text, Function onPressed){
  return TextButton(
      onPressed: (){
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE7EFF6)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
  );
}