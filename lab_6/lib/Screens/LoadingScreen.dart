import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_6/Screens/LoadedScreen.dart';
import 'package:lab_6/cubit/NasaCubit.dart';
import 'package:lab_6/cubit/NasaStates.dart';
import 'ErrorScreen.dart';

class Loadingscreen extends StatelessWidget{
    String sol;

    Loadingscreen({required this.sol});

   @override
  Widget build(BuildContext context) {

    return BlocListener<Nasacubit, NasaState>(
      listener: (context, state) {
        if (state is NasaLoadedState) {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => Loadedscreen())
          );
        } else if (state is NasaErrorState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Errorscreen())
          );
        }
      },
      child: Scaffold(
        body: BlocBuilder<Nasacubit, NasaState>(
          builder: (context, state) {
            if (state is NasaLoadingState) {
              BlocProvider.of<Nasacubit>(context).loadData(sol);
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(); 
          },
        ),
      ),
    );
  }
}
    
