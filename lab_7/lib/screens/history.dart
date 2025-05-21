import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_7/cubit/HistoryCubit.dart';
import 'package:lab_7/cubit/HistoryState.dart';

class MyScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    
    return Scaffold(appBar: AppBar(),
    body:BlocBuilder<Historycubit,Historystate>(builder: 
    (context,state){
      if (state is LoadHistoryState){
          BlocProvider.of<Historycubit>(context).loadHistory();
          return const Center(child: CircularProgressIndicator());
      }
        if(state is LoadedHistoryState){
          return
            Container(
              child: Column(
                children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      Text("Температура"),
                      Text("Скорость Ветра"),
                      Text("Время")
                        ]
                      ),

                    for(int i=0;i<state.time.length;i++)
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(state.temp[i]),
                            Text(state.windSpeed[i]),
                            Text(state.time[i])
                          ],
                        ),
                        Container(padding: EdgeInsets.all(3.0),),
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);
                              }, 
                              child: Text("На главный экран")
                              )
                    
                        ]
                        )
            );
        }
        return Center();
    }
    )
    );
  }
}
                      

     

class HistoryProvider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<Historycubit>(create: (context)=>Historycubit(),
    child: MyScreen());
  }
}