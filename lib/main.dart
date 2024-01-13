import 'package:flutter/material.dart';
import 'screens/Dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const  MyApp({Key?key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming with Codebroker',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Dashboard()
    );
  }
}
