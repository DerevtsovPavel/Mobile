import 'FirstScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Лабораторная работа 3. Деревцов Павел, ВМК-22'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirstScreen();
    
  }
    
  }


  