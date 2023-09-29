import 'package:flutter/material.dart';
import 'package:renstatefrontend/ui-mesagge/messages_view.dart';

import '../router/routes.dart';
//import 'src/init_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: MessagesView.id,
      routes: customRoutes,
    );
  }
}
