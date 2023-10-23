import 'package:flutter/material.dart';
import 'package:renstatefrontend/shared/bottomNavigationApp.dart';

class AllResults extends StatelessWidget {
  static const String id = 'allresult';
  const AllResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    searchDesign(),
                    tittleResult(),
                    viewPost(),
                    viewPost(),
                    viewPost(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationApp(),
    );
  }
}

Widget searchDesign() {
  return Column(
    children: [
      Text(
        'Search',
        style: TextStyle(
          color: Color(0xFF064789),
          fontSize: 36,
          fontWeight: FontWeight.w400,
        ),
      ),
      TextField(
        style: TextStyle(fontFamily: 'Inter'),
        maxLines: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    ],
  );
}

Widget tittleResult() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Text(
      'ALL RESULTS',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w900,
        letterSpacing: 0.52,
      ),
    ),
  );
}

Widget viewPost() {
  return Card(
    color: Color(0xFF064789),
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(3)),
          Center(
            child: Text(
              "tittle",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.55,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Center(
            child: Text(
              'S/. 9989',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.52,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Image(
                image: NetworkImage(
                  'https://images.pexels.com/photos/2079246/pexels-photo-2079246.jpeg?auto=compress&cs=tinysrgb&w=600',
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Text(
                'Lorem lorem lorem lorem jd dggd l dldj s sgjs gs s ñgs gsjñ ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: buttonDetails(),
          ),
        ],
      ),
    ),
  );
}

Widget buttonDetails() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextButton(
      child: Text(
        'Detalles',
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          letterSpacing: 0.52,
        ),
      ),
      onPressed: () {},
    ),
  );
}
