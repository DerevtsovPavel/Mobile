import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_5/screens/cubit/HistoryCubit.dart';
import 'cubit/HistoryState.dart';

class MyScreen extends StatefulWidget{
  @override
  State<MyScreen> createState() => HistoryScreen();
}

class HistoryScreen extends State<MyScreen>{
  @override
  Widget build(BuildContext context){
    BlocProvider.of<HistoryScreenCubit>(context).load();
    return Scaffold(appBar: AppBar(),
    body:BlocBuilder<HistoryScreenCubit,HistoryScreenState>(builder: 
    (context,state){
        if(state is LoadHistoryState){
          return
            Container(
              child: Column(
                children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      Text("a"),
                      Text("b"),
                      Text("result")
                        ]
                      ),

                      for(int i=0; i<state.history_a.length; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(state.history_a[i]),
                            Text(state.history_b[i]),
                            Text(state.history_res[i])
                          ],
                        )

                    ]
              ),
            );
        }
        return Container();
    }
    )
    );
  }
}

class HistoryProvider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryScreenCubit>(create: (context)=>HistoryScreenCubit(),
    child: MyScreen());
  }
}