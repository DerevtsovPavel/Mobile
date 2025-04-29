import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_6/cubit/NasaCubit.dart';
import 'package:lab_6/cubit/NasaStates.dart';
import 'package:image_network/image_network.dart';

class Loadedscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Nasacubit,NasaState>(builder: (context,state){

        if(state is NasaLoadedState){
          return ListView.builder(
            itemCount: state.data.photos!.length,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: 200,
                child: ImageNetwork(image: state.data.photos![index].imgSrc!,height: 200, width: 400),
              );
            },
          );        
        }
       
       
       return Center();
      })
    );
  }
}