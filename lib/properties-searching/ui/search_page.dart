import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/all_results.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static String id = 'search_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                )),
            const Padding(padding: EdgeInsets.all(8)),
            const TextField(
                style: TextStyle(fontFamily: 'Inter'),
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                )),
            const Padding(padding: EdgeInsets.all(16.0)),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllResults.id);
                  },
                  child: const Text('Departamentos'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllResults.id);
                  },
                  child: const Text('Locales Comerciales'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllResults.id);
                  },
                  child: const Text('Cuartos'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllResults.id);
                  },
                  child: const Text('Viviendas'),
                ),
              ],
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.black),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
