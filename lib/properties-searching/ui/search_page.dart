import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/all_results.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';

import '../../shared/appBarApp.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static String id = 'search_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: appBarApp(context),
      body: Center(
          child: Container(
            width: 320,
            height: 700,
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(20)),
                const Text(
                  //Label Search
                    'Search',
                    style: TextStyle(
                      color: Color(0xFF064789),
                      fontSize: 36,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    )
                ),
                const Padding(padding: EdgeInsets.all(16.0)),
                Column(
                  children: [

                    filterButton(
                        context,
                        "Department",
                            (){
                          Navigator.pushNamed(context, AllResults.id);
                        }),
                    filterButton(
                        context,
                        "Home",
                            (){
                          Navigator.pushNamed(context, AllResults.id);
                        }),
                    filterButton(
                        context,
                        "Commercial Space",
                            (){
                          Navigator.pushNamed(context, AllResults.id);
                        }),
                    filterButton(
                        context,
                        "Room",
                            (){
                          Navigator.pushNamed(context, AllResults.id);
                        }),
                  ],
                ),
              ],
            ),
          )),
      bottomNavigationBar: bottomNavigationApp(context),
    );
  }
}


Widget filterButton(context, String text, Function onPressed){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: FractionallySizedBox(
      widthFactor: 0.8,
      child: TextButton(
          onPressed: (){
            onPressed();
      },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
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
          )
      ),
    ),
  );
}