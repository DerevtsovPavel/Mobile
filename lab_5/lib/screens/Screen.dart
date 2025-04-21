import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/States.dart';
import 'cubit/Cubit.dart';
import 'HistoryScreen.dart';

class MyScreen extends StatefulWidget{
  @override
  State<MyScreen> createState() => Screen();
}

class Screen extends State<MyScreen>{
    double a=0,b=0;
    bool agreement = false;
    final form_key = GlobalKey<FormState>();
    final field_a = TextEditingController();
    final field_b = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(
      title: Text("Деревцов ВМК-22, Cubit"),
      actions: [
        IconButton(icon: const Icon(Icons.history),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryProvider()));
        },)
      ],
    ),
    body:BlocBuilder<MainScreenCubit,MainScreenState>(
      builder: (context, state){
        
      if (state is NullState){
        return
      
        Container(
          padding: EdgeInsets.all(2),
          child: Form(
                key: form_key,
                child: Column(children:
                      [
                        TextFormField(
                        controller: field_a,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "a"),
                        validator: (value) {
                          if (value!.isEmpty) return "Введите число";
                          final double? num = double.tryParse(value);
                          if(num==null){
                            return "Введите число";
                          }
                        },
                        ),

                      TextFormField(
                        controller: field_b,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "b"),
                        validator: (value) {
                          if (value!.isEmpty) return "Введите число";
                          final double? num = double.tryParse(value);
                          if(num==null){
                            return "Введите число";
                          }
                        },
                        ),

                      CheckboxListTile(value: agreement,
                          title: Text("Я согласен"),
                          onChanged: (value) => setState(()=>agreement = value!),
                      
                      ),

                      ElevatedButton(onPressed: (){
                        if(form_key.currentState!.validate() && agreement){
                              BlocProvider.of<MainScreenCubit>(context).calc(
                               double.parse(field_a.text),
                               double.parse(field_b.text),
                              );
                              }
                      },
                      
                      child: Text("Рассчитать")
                  ),
                  ],
              )
          )
        );
      }
      else if (state is ProcessedState){
        return Scaffold(appBar:AppBar() ,
              body: Column(children:[
                Center(
                child: Text("a^3 + b^3 = (" + state.a.toString()+ ")^3 + (" + state.b.toString() + ")^3 = " + state.value.toStringAsFixed(2))
              ),
              ElevatedButton(onPressed: (){
                BlocProvider.of<MainScreenCubit>(context).save(state.a, state.b, state.value);
                BlocProvider.of<MainScreenCubit>(context).remove();
              },
              child: Text("Назад"),)
              ]
                  )
        );
      }
    
      else{
      return Container();
      }
    }
    )
    );
    
  }
      
  
}


class ScreenProvider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenCubit>(create: (context)=>MainScreenCubit(),
    child: MyScreen());
  }
}
