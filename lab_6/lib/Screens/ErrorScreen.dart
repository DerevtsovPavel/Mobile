import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_6/cubit/NasaCubit.dart';
import 'package:lab_6/cubit/NasaStates.dart';

class Errorscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Nasacubit,NasaState>(builder: (context,state){
        if(state is NasaErrorState){
          return const Center(child: Text("Произошла ошибка"));
        }
        return Center();
          
      })
    );
  }
}