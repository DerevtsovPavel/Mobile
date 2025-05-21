import 'package:flutter/material.dart';
import 'package:lab_7/screens/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/ApiCubit.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApiCubit(),
        ),
      ],
      child: MaterialApp(home:WeatherScreen())
      );
     
}
}