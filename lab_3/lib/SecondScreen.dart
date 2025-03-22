import 'dart:math';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  double a,b;
  SecondScreen({ required this.a, required this.b});


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar() ,
    body: Center(
      child: Text( "a^3 + b^3 = (" + a.toString()+ ")^3 + (" + b.toString() + ")^3 = " + func(a,b).toStringAsFixed(2)),
    ),
    );
  }
    num func(double a,double b){
    return pow(a,3)+pow(b,3);
  }
}
