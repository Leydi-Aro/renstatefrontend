
import 'package:flutter/cupertino.dart';

Widget showImageProfile(){
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
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
  );
}