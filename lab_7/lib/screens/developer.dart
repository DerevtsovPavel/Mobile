import 'package:flutter/material.dart';

class Developer_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Ф.И.О: Деревцов Павел Андреевич"),
        Text("Группа: ВМК-22"),
        Text("e-mail: pavel030504@gmail.com"),
        Container(padding: EdgeInsets.all(3.0),),
                 ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                 }, child: Text("На главный экран"))
      ],
      ),
    );
  }
}