import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';
import 'package:renstatefrontend/ui-mesagge/replyMessage.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text("Received Messages", style: TextStyle(
              color: Color(0xFF064789),
              fontWeight: FontWeight.bold,
              fontSize: 26.0,
            ),),
          ),
          Expanded(
            child: ListView(
              children: [
                showMessage(context),
                showMessage(context),
                showMessage(context),
                showMessage(context),
                showMessage(context),
              ],
            ),
          ),
          bottomNavigationApp(context),
        ],
      ),
    );
  }

}

Widget showMessage(BuildContext context) {
  final cardColor = Color(0xFF064789);

  return Card(
    color: cardColor,
    margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fabrizio Romano',
                style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buttonReply(context),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(
              'Here we go',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buttonReply(BuildContext context){
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>ReplyMessage()),
      );
    },
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    ),
    child: Text(
      'Reply',
      style: TextStyle(
        fontSize: 15.0,
      ),
    ),
  );
}



