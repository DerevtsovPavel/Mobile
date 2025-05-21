import 'HistoryState.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';

class Historycubit extends Cubit<Historystate> {
  Historycubit(): super (LoadHistoryState());

  void loadHistory() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? temp = prefs.getStringList("temperature");
    final List<String>? windSpeed = prefs.getStringList("wind_speed");
    List<String>? time = prefs.getStringList("time");
    emit(LoadedHistoryState(temp: temp!, windSpeed: windSpeed!, time: time!));
  }
}