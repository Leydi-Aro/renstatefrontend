

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';

class ReceivedMessages extends StatefulWidget {
  const ReceivedMessages({super.key});
  static String id = 'received_messages';

  @override
  State<ReceivedMessages> createState() => _ReceivedMessagesState();
}

class _ReceivedMessagesState extends State<ReceivedMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(context),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                _buildCardWithTwoMessages(),
                _buildCardWithTwoMessages(),
                _buildCardWithTwoMessages(),
              ],
            ),
          ),
          bottomNavigationApp(),
        ],
      ),
    );
  }
}

Widget _buildCardWithTwoMessages() {
  final cardColor = Color(0xFF064789);
  return Card(
    color: cardColor,
    margin: EdgeInsets.all(20.0), // Reduce el margen de la tarjeta
    child: SizedBox(
      height: 143.0, // Ajusta la altura de la tarjeta
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: 70.0,
              height: 40.0,
              margin: EdgeInsets.only(
                  bottom: 10.0), // Agrega espacio entre los recuadros blancos
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Autor',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Container(
              color: Colors.white,
              width: 430.0,
              height: 60.0,
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Message',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

