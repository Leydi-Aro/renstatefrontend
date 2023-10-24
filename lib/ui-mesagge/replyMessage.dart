

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';

class ReplyMessage extends StatefulWidget {
  const ReplyMessage({super.key});

  @override
  State<ReplyMessage> createState() => _ReplyMessageState();
}

class _ReplyMessageState extends State<ReplyMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarApp(context),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Send Message",style: TextStyle(
                color: Color(0xFF064789),
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
              textAlign: TextAlign.center,),
            ),
            inputMessage(),
          ],
        ),

      ),
      bottomNavigationBar: bottomNavigationApp(context),
    );
  }
}

Widget inputMessage() {
  TextEditingController messageController = TextEditingController();

  return FractionallySizedBox(
    widthFactor: 0.86,
    child: Card(
      margin: EdgeInsets.all(10.0),
      elevation: 3,
      color: Color(0xFF064789),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              color: Color(0xFFE7EFF6),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Text(
                  'To: Fabrizio Romano',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              color: Color(0xFFE7EFF6),
              constraints: BoxConstraints(
                minHeight: 200.0,
              ),
              child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Write your message',
                  filled: true,
                  fillColor: Color(0xFFE7EFF6),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                maxLines: null,
              ),
            ),

            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {

              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE7EFF6)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: Text(
                  'Send',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

