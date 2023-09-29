// ignore: unused_import
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: SafeArea(
            child: Container(
                width: 375,
                height: 700,
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Colors.white),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.search),
                          )),
                      Center(
                        //BUTTONS
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 30),
                            ElevatedButton(
                              //Departamentos
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFFE7EFF6))),
                              onPressed: null,
                              child: Text(
                                'Departamentos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF064789),
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 4,
                                  letterSpacing: 0.52,
                                ),
                              ),
                            ), //Departamentor
                            Padding(padding: EdgeInsets.all(10)),
                            ElevatedButton(
                              //Locales Comerciales
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFFE7EFF6))),
                              onPressed: null,
                              child: Text(
                                'Locales Comerciales',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF064789),
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 4,
                                  letterSpacing: 0.52,
                                ),
                              ),
                            ), //Locales Comerciales
                            Padding(padding: EdgeInsets.all(10)),
                            ElevatedButton(
                              //Cuartos
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFFE7EFF6))),
                              onPressed: null,
                              child: Text(
                                'Cuartos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF064789),
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 4,
                                  letterSpacing: 0.52,
                                ),
                              ),
                            ), //Cuartos
                            Padding(padding: EdgeInsets.all(10)),
                            ElevatedButton(
                              //Viviendas
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFFE7EFF6))),
                              onPressed: null,
                              child: Text(
                                'Viviendas',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF064789),
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 4,
                                  letterSpacing: 0.52,
                                ),
                              ),
                            ), //Viviendas
                          ],
                        ),
                      )
                    ])))));
  }
}
