import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBarColor = Color(0xFF064789);
    final buttonColor = Color(0xFF002C3E);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Received Messages',
            style: TextStyle(
              color: appBarColor,
              fontSize: 24.0,
            ),
          ),
        ),
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
            BottomAppBar(
              child: Container(
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        // Acción
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Acción
                      },
                    ),
                    InkWell(
                      // InkWell hace que el botón central sea interactivo
                      onTap: () {
                        // Acción
                      },
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 36.0,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {
                        // Acción
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        // Acción
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
                margin: EdgeInsets.only(bottom: 10.0), // Agrega espacio entre los recuadros blancos
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

}