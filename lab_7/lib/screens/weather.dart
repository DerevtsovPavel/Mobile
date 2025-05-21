import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_7/cubit/ApiCubit.dart';
import 'package:lab_7/cubit/ApiStates.dart';
import 'package:lab_7/screens/converter.dart';
import 'package:lab_7/screens/history.dart';
import 'package:url_launcher/url_launcher.dart';
import 'developer.dart';

class WeatherScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Погода"),
        actions: [
          IconButton( icon: const Icon(Icons.history),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryProvider()));},)
        ],
      ),
      body: BlocBuilder<ApiCubit,ApiStates>(builder: (context,state){
        if (state is LoadingState){
          BlocProvider.of<ApiCubit>(context).LoadData();
          return const Center(child: CircularProgressIndicator());
        }

        if(state is ErrorState){
          return const Center(child: Text("Произошла ошибка"));
        }

        else if (state is LoadedStates){
          num temp = state.data.hours![0].airTemperature!.ecmwf!;
          num ws = state.data.hours![0].windSpeed!.ecmwf!;
          String time = state.data.meta!.start!;
          BlocProvider.of<ApiCubit>(context).SaveInHistory(temp, ws, time);
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Температура, °C"),
                Text("Скорость Ветра")
              ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(temp.toString()),
                  Text(ws.toString())
                ],
              ),
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ConverterProvider()));}, child: Text("Перевод давления")),
              Container(padding: EdgeInsets.all(5.0),),
              ElevatedButton(onPressed: ()async{
                const url = "https://yandex.ru/pogoda/ru/chita/pressure";
                if(await canLaunch(url)){
                  await launch(url);
                }
                else{
                  await showDialog(
                        context: context,
                        builder: (context) => new AlertDialog(
                          title: new Text('Error'),
                          content: Text(
                                  'Could not launch $url'),
                          actions: <Widget>[
                            new ElevatedButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: new Text('OK'),
                            ),
                          ],
                        ),
                      );
                }
              }, 
              child: Text("График Давления")),
              Container(padding: EdgeInsets.all(5.0),),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Developer_Screen()));
              }, child: Text("О разработчике"))
            ],
          );
        }

        return Center();
      }
      ),
      
    );
    
  }
}