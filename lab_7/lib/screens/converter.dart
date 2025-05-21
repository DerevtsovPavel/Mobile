import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_7/cubit/ProcessingCubit.dart';
import 'package:lab_7/cubit/ProcessingStates.dart';

class MyScreen extends StatelessWidget {
  final form_key = GlobalKey<FormState>();
  final field = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Processingcubit,Processingstates>(
        builder:(context,state){
            if(state is ProcessingState){
              return Form(
                key: form_key,
                child: Column(children: [
                TextFormField(
                  controller: field,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Pa"),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Введите число";
                    }
                    final double? num = double.tryParse(value);
                          if(num==null){
                            return "Введите число";
                          }
                  },
                ),
                ElevatedButton(onPressed: (){
                  if(form_key.currentState!.validate()){
                    BlocProvider.of<Processingcubit>(context).convert(double.parse(field.text));
                  }
                },
                 child: Text("В мм. рт. ст.")
                 ),
                 Container(padding: EdgeInsets.all(3.0),),
                 ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                 }, child: Text("На главный экран"))
              ],
              )
              );
            }
            if(state is ProcessedState){
              return Scaffold(appBar:AppBar() ,
              body: Column(children:[
                Center(
                child: Text(state.pascals.toString()+" Pa == "+state.mm.toString()+" мм рт ст")
              ),
              ElevatedButton(onPressed: (){
                BlocProvider.of<Processingcubit>(context).remove();
              },
              child: Text("Назад"),)
              ]
                  )
        );
            }
            return Center();
        } 
      ),
    );
  }
}

class ConverterProvider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<Processingcubit>(create: (context)=>Processingcubit(),
    child: MyScreen());
  }
}