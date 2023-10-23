
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buttonApp(String text, Function onPressed){
  return FractionallySizedBox(
    child: TextButton(
      onPressed: (){
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
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
    ),
  );
}