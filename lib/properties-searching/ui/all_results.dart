import 'package:flutter/material.dart';

class AllResults extends StatelessWidget {
  // final List<String> _elementos;
  static const String id = 'allresult';
  const AllResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
              child: Container(
                  width: 320,
                  height: 700,
                  margin: const EdgeInsets.all(15),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(padding: EdgeInsets.all(20)),
                        Text(
                            //Label Search
                            'Search',
                            style: TextStyle(
                              color: Color(0xFF064789),
                              fontSize: 36,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            )),
                        Padding(padding: EdgeInsets.all(8)),
                        TextField(
                            style: TextStyle(fontFamily: 'Inter'),
                            maxLines: 1,
                            // Navega a la segunda pantalla,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.search),
                            )),
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          'ALL RESULTS',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900,
                            height: 0,
                            letterSpacing: 0.52,
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Card(
                                  color: (Color(0xFF064789)),
                                  //elevation: 5, // Si deseas agregar sombra
                                  child: SizedBox(
                                    width: 343,
                                    height: 190,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.all(3)),
                                        Center(
                                          child: Text(
                                            'Título',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.52,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 3)),
                                        Center(
                                          child: Text(
                                            'S/. 9989',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.52,
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(3)),
                                        Center(
                                            child: Image(
                                                image: NetworkImage(
                                                    'https://ibb.co/5L2PZtZ'),
                                                width: 15,
                                                height: 15)),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Text(
                                              'Lorem lorem lorem\nlorem jd dggd l dldj s sgjs gs s ñgs gsjñ ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        Center(
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
                                        ),
                                        Padding(padding: EdgeInsets.all(3))
                                      ],
                                    ),
                                  )),
                              Card(
                                  color: (Color(0xFF064789)),
                                  //elevation: 5, // Si deseas agregar sombra
                                  child: SizedBox(
                                    width: 343,
                                    height: 190,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.all(3)),
                                        Center(
                                          child: Text(
                                            'Título',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.52,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 3)),
                                        Center(
                                          child: Text(
                                            'S/. 9989',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.52,
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(3)),
                                        Center(
                                            child: Image(
                                                image: NetworkImage(
                                                    'https://ibb.co/5L2PZtZ'),
                                                width: 15,
                                                height: 15)),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Text(
                                              'Lorem lorem lorem\nlorem jd dggd l dldj s sgjs gs s ñgs gsjñ ',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        Center(
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
                                        ),
                                        Padding(padding: EdgeInsets.all(3))
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ])))),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels:
            false, // Oculta el texto de los elementos seleccionados
        showUnselectedLabels:
            false, // Oculta el texto de los elementos no seleccionados
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            //home
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            //search
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            //add
            icon: Icon(Icons.add, color: Colors.black),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            //message
            icon: Icon(Icons.message, color: Colors.black),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            //profile
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
