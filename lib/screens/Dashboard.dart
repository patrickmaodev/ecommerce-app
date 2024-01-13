import 'Dart:math';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: Center(child: Text("Random value is : ${getNumber()}")),
    );
  }
}

int getNumber (){
  return Random().nextInt(100);
}
