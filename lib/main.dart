import 'package:flutter/material.dart';
import './app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      initialRoute: '/',
      routes: appRoutes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
