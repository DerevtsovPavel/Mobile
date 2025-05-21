import 'package:bloc/bloc.dart';
import 'package:lab_7/api/api.dart';
import 'package:lab_7/models/Weather.dart';
import 'ApiStates.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCubit extends Cubit<ApiStates>{
  ApiCubit():super (LoadingState());

  void LoadData() async{
    try{
      Map<String,dynamic> weathe = await getData();
      weather data = weather.fromJson(weathe);
      emit(LoadedStates(data: data));
      return;
    }
  
    catch(e){
      emit(ErrorState());
      return;
    }
  }

  void SaveInHistory(num temperature, num wind_speed,String time) async{
     final prefs = await SharedPreferences.getInstance();

     if(prefs.getStringList('temperature')==null){
        List<String> temp_list = [];
        temp_list.add(temperature.toString());
        prefs.setStringList("temperature", temp_list);
     }
     else{
        final List<String>? temp_list = prefs.getStringList('temperature');
        temp_list!.add(temperature.toString());
        prefs.setStringList("temperature", temp_list);
    }

    if(prefs.getStringList('wind_speed')==null){
        List<String> wind_list = [];
        wind_list.add(temperature.toString());
        prefs.setStringList("wind_speed", wind_list);
     }
     else{
        final List<String>? wind_list = prefs.getStringList('wind_speed');
        wind_list!.add(wind_speed.toString());
        prefs.setStringList("wind_speed", wind_list);
    }

    if(prefs.getStringList('time')==null){
        List<String> time_list = [];
        time_list.add(time);
        prefs.setStringList("time", time_list);
     }
     else{
        final List<String>? time_list = prefs.getStringList('time');
        time_list!.add(time);
        prefs.setStringList("time", time_list);
    }
  }
}