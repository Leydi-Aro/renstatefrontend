import 'package:flutter/material.dart';
import 'package:renstatefrontend/properties-searching/ui/see_post.dart';
import 'package:renstatefrontend/ui-initial-section/init_view.dart';
import '../router/routes.dart';

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
      initialRoute: InitView.id,
      routes: customRoutes,
    );
  }
}
