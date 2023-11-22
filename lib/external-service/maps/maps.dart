import 'package:flutter/material.dart';
import 'package:renstatefrontend/external-service/maps/google_maps_screen.dart';
import 'package:renstatefrontend/shared/appBarApp.dart';

void main() {
  runApp(const GoogleMaps());
}

class GoogleMaps extends StatelessWidget {
  const GoogleMaps({super.key});
  static String id = 'maps_view';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Google Maps',
      debugShowCheckedModeBanner: false,
      home: InitScreen(),
    );
  }
}

class InitScreen extends StatefulWidget {
  const InitScreen();

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GoogleMapsScreen(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Google Maps',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
