import 'package:flutter/cupertino.dart';

Widget logo(){
  return Container(
    width: double.infinity,
    height: 220,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://i.ibb.co/9T6qrHD/logoroom.png'),
      ),
    ),
  );
}