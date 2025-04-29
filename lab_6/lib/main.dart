import 'package:flutter/material.dart';
import 'package:lab_6/Screens/LoadingScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/NasaCubit.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   final field_a = TextEditingController();
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Nasacubit(),
      child: MaterialApp(
        home: Builder( // Добавляем Builder для корректного контекста
          builder: (context) => Scaffold(
            body: Column(
              children: [
                Text("Введите название марсохода"),
                TextField(controller: field_a),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Loadingscreen(sol: field_a.text)));
                  },
                  child: Text("Ввести")
                ),
              ]
            )
          )
        )
      )
    );
  }
}
